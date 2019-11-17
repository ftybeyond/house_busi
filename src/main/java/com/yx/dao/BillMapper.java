package com.yx.dao;

import com.yx.common.PageProxy;
import com.yx.model.Bill;
import java.util.List;

public interface BillMapper {
    int insert(Bill record);

    List<Bill> selectPayable(Integer agreement);

    int overDelete(Integer agreement);

    List<Bill> selectListJoinByPage(PageProxy pageProxy);

    int selectCountJoinByPage(PageProxy pageProxy);

    int doCharge(Bill bill);

    int update(Bill bill);

    int deleteById(Integer id);

}