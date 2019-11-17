package com.yx.service;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Bill;

import java.util.List;

public interface IChargeService {

    public DataTableRspWrapper<Bill> list(PageProxy pageProxy);

    public int doCharge(Bill bill);

    int updateBill(Bill bill);

    int deleteById(Integer id);
}
