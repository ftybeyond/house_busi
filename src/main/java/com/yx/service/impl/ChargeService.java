package com.yx.service.impl;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.dao.BillMapper;
import com.yx.model.Bill;
import com.yx.service.IChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class ChargeService implements IChargeService {

    @Autowired
    BillMapper billMapper;

    @Override
    public DataTableRspWrapper<Bill> list(PageProxy pageProxy) {
        DataTableRspWrapper<Bill> rspWrapper = new DataTableRspWrapper();
        rspWrapper.setRecordsTotal(billMapper.selectCountJoinByPage(pageProxy));
        rspWrapper.setData(billMapper.selectListJoinByPage(pageProxy));
        return rspWrapper;
    }

    @Override
    public int doCharge(Bill bill) {
        bill.setState(1);
        bill.setStamp(new Date());
        return billMapper.doCharge(bill);
    }

    @Override
    public int updateBill(Bill bill){
        return billMapper.update(bill);
    }

    @Override
    public int deleteById(Integer id){
        return billMapper.deleteById(id);
    }

}
