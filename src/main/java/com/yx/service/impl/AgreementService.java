package com.yx.service.impl;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.dao.*;
import com.yx.model.*;
import com.yx.model.common.UpdateMap;
import com.yx.service.IAgreementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Transactional
@Service
public class AgreementService implements IAgreementService {

    @Autowired
    AgreementMapper agreementMapper;

    @Autowired
    AccessoryMapper accessoryMapper;

    @Autowired
    HouseMapper houseMapper;

    @Autowired
    HouseAgreementMapper houseAgreementMapper;

    @Autowired
    BillMapper billMapper;

    @Override
    @Transactional
    public int insert(Agreement agreement) {
        agreement.setState(0);
        int effect = agreementMapper.insert(agreement);
        List<Accessory> list = agreement.getAccessories();
        if(list!=null && list.size()>0){
            for (Accessory accessory:list){
                accessory.setPrimaryKey(agreement.getId());
               effect +=  accessoryMapper.insert(accessory);
            }
        }
        return effect;
    }

    @Override
    public int update(Agreement agreement) {
        Agreement original = agreementMapper.selectByPrimaryKey(agreement.getId());
        original.setContacts1(agreement.getContacts1());
        original.setContacts1Tel(agreement.getContacts1Tel());
        original.setContacts2(agreement.getContacts2());
        original.setContacts2Tel(agreement.getContacts2Tel());
        original.setEffectDate(agreement.getEffectDate());
        original.setEndDate(agreement.getEndDate());
        original.setPayRound(agreement.getPayRound());
        original.setRent(agreement.getRent());
        original.setSerialNumber(agreement.getSerialNumber());
        original.setSignDate(agreement.getSignDate());
        original.setTitle(agreement.getTitle());
        original.setChargeTimes(agreement.getChargeTimes());
        int effect = agreementMapper.updateByPrimaryKey(original);
        List<Accessory> list = agreement.getAccessories();
        if(list!=null && list.size()>0){
            for (Accessory accessory:list){
                accessory.setPrimaryKey(agreement.getId());
                effect +=  accessoryMapper.insert(accessory);
            }
        }
        return effect;
    }

    @Override
    public DataTableRspWrapper<Agreement> table(PageProxy pageProxy) {
        DataTableRspWrapper<Agreement> rspWrapper = new DataTableRspWrapper<>();
        rspWrapper.setData(agreementMapper.selectByPage(pageProxy));
        rspWrapper.setRecordsTotal(agreementMapper.selectCountByPage(pageProxy));
        return rspWrapper;
    }

    @Override
    @Transactional
    public int delete(Integer id) {
        Agreement original = agreementMapper.selectByPrimaryKey(id);
        if(original.getState()>0){
            return -1;
        }else{
            int effect = agreementMapper.deleteByPrimaryKey(id);
            Map map = new HashMap();
            map.put("table","agreement");
            map.put("key",id);
            effect += accessoryMapper.deleteByKey(map);
            return effect;
        }

    }

    @Override
    public int deleteAccessory(Integer id){
        return accessoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public String selectContentById(Integer id){
        return agreementMapper.selectContentById(id);
    }

    @Override
    public List<Accessory> getAccessories(Integer id){
        Map map = new HashMap();
        map.put("table","agreement");
        map.put("key",id);
        return accessoryMapper.selectByKey(map);
    }

    @Override
    public int saveContent(Integer id,String content){
        Map map = new HashMap();
        map.put("content",content);
        return agreementMapper.updateByMap(new UpdateMap("agreement",id,map));
    }

    /**
     * 合同履行
     * @param agreement 合同ID
     * @return
     */
    @Override
    @Transactional
    public int perform(Integer agreement){
        if(agreement!=null){
            int effect = 0;
            Agreement agreementObj = agreementMapper.selectByPrimaryKey(agreement);
            if(agreementObj.getState() != 1){
                return -1;
            }
            //合同状态变更
            Map m = new HashMap();
            m.put("state",2);
            effect += agreementMapper.updateByMap(new UpdateMap("agreement",agreement,m));
            //生成合同账单
            for (int i=0;i<agreementObj.getChargeTimes();i++) {
                Bill bill = new Bill();
                bill.setAgreement(agreement);
                bill.setPayable(agreementObj.getRent());
                bill.setState(0);
                bill.setStamp(new Date());
                bill.setAccountPeriod(getNextPeriod(agreementObj,i));
                billMapper.insert(bill);
            }
            return effect;
        }
        return 0;
    }

    /**
     * 合同解除
     * @param house
     * @param agreement
     * @return
     */
    @Override
    @Transactional
    public int relieve(Integer house, Integer agreement){
        int effect = 0;
        Agreement agreementObj = agreementMapper.selectByPrimaryKey(agreement);
        if(agreementObj.getState() != 1){
            return -1;
        }
        //删除关联表
        HouseAgreement houseAgreement = new HouseAgreement();
        houseAgreement.setHouse(house);
        houseAgreement.setAgreement(agreement);
        effect += houseAgreementMapper.delete(houseAgreement);
        //置空房屋表agreement字段
        effect += houseMapper.relieveAgreement(house);
        return effect;
    }

    /**
     * 终止合同
     * @param house
     * @param agreement
     * @return
     */
    @Override
    @Transactional
    public int over(Integer house, Integer agreement, String endDate, Double payable, Double payment,String invoice){
        int effect = 0;
        //处理为待付款账单
        effect += billMapper.overDelete(agreement);
        //house关联合同置空
        effect += houseMapper.relieveAgreement(agreement);
        //agreement状态置4
        Agreement update = new Agreement();
        update.setId(agreement);
        update.setState(4);
        effect += agreementMapper.updateState(update);
        //生成新的付款单
        Bill bill = new Bill();
        bill.setAgreement(agreement);
        bill.setPayable(payable);
        bill.setPayment(payment);
        bill.setState(1);
        bill.setStamp(new Date());
        bill.setInvoice(invoice);
        bill.setRemark("合同终止于-" +endDate);
        effect += billMapper.insert(bill);
        return effect;
    }

    @Override
    public List<House> houses(Integer agreement){
        return houseMapper.selectByAgreement(agreement);
    }

    @Override
    public List<Bill> getPayable(Integer agreement){
        return billMapper.selectPayable(agreement);
    }

    /**
     * 获取指定起始时间的下一账期
     * @return
     */
    public static Date getNextPeriod(Agreement agreement,Integer times){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(agreement.getEffectDate());
        switch (agreement.getPayRound()){
            case 1:
                //年
                calendar.add(Calendar.YEAR,1*times);
                return calendar.getTime();
            case 2:
                //半年
                calendar.add(Calendar.MONTH,6*times);
                return calendar.getTime();
            case 3:
                calendar.add(Calendar.MONTH,3*times);
                return calendar.getTime();
            case 4:
                //月
                calendar.add(Calendar.MONTH,1*times);
                return calendar.getTime();
            case 5:
                //一次性
                return null;
        }
        return null;
    }
}
