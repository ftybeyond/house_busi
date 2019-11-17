package com.yx.service.impl;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.dao.AgreementMapper;
import com.yx.dao.HouseAgreementMapper;
import com.yx.dao.HouseMapper;
import com.yx.model.House;
import com.yx.model.HouseAgreement;
import com.yx.model.common.UpdateMap;
import com.yx.service.IHouseService;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class HouseService implements IHouseService {

    @Autowired
    HouseMapper houseMapper;

    @Autowired
    HouseAgreementMapper houseAgreementMapper;

    @Autowired
    AgreementMapper agreementMapper;

    @Override
    public List<House> list(Integer pid) {
        return houseMapper.selectAll();
    }

    @Override
    public int insert(House house) {
        return houseMapper.insert(house);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {

        //todo 关联查询合同，确认删除状态
        return houseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(House house) {
        House original = houseMapper.selectByPrimaryKey(house.getId());
        original.setArea(house.getArea());
        original.setHouseCode(house.getHouseCode());
        original.setHouseNumber(house.getHouseNumber());
        original.setCertificate(house.getCertificate());
        original.setDecorate(house.getDecorate());
        original.setLayout(house.getLayout());
        original.setNature(house.getNature());
        original.setOwner(house.getOwner());
        original.setRemark(house.getRemark());
        return houseMapper.updateByPrimaryKey(original);
    }

    public DataTableRspWrapper<House> table(PageProxy pageProxy){
        DataTableRspWrapper<House> rspWrapper = new DataTableRspWrapper<>();
        rspWrapper.setData(houseMapper.selectByPage(pageProxy));
        rspWrapper.setRecordsTotal(houseMapper.selectCountByPage(pageProxy));
        return rspWrapper;
    }

    @Override
    @Transactional
    public int relateAgreement(Integer[] houses, Integer agreement) {
        int effect=0;
        Map m = new HashMap();
        m.put("state",1);
        effect += agreementMapper.updateByMap(new UpdateMap("agreement",agreement,m));

        for(Integer house:houses){
            HouseAgreement houseAgreement = new HouseAgreement();
            houseAgreement.setAgreement(agreement);
            houseAgreement.setHouse(house);
            houseAgreement.setStamp(new Date());
            Map map = new HashMap();
            map.put("agreement",agreement);
            effect += houseMapper.updateByMap(new UpdateMap("house",house,map));
            effect += houseAgreementMapper.insert(houseAgreement);
        }
        return effect;
    }


    @Override
    public DataTableRspWrapper<House> leaseList(PageProxy pageProxy){
        DataTableRspWrapper<House> rspWrapper = new DataTableRspWrapper<>();
        rspWrapper.setData(houseMapper.selectWithAgreementByPage(pageProxy));
        rspWrapper.setRecordsTotal(houseMapper.selectCountWithAgreement(pageProxy));
        return rspWrapper;
    }
}
