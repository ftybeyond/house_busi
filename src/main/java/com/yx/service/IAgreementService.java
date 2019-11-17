package com.yx.service;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Accessory;
import com.yx.model.Agreement;
import com.yx.model.Bill;
import com.yx.model.House;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IAgreementService {

    public int insert(Agreement agreement);

    public int update(Agreement agreement);

    public DataTableRspWrapper<Agreement> table(PageProxy pageProxy);

    public int delete(Integer id);

    int deleteAccessory(Integer id);

    String selectContentById(Integer id);

    List<Accessory> getAccessories(Integer id);

    int saveContent(Integer id, String content);

    int perform(Integer agreement);

    int relieve(Integer house, Integer agreement);

    int over(Integer house, Integer agreement, String endDate, Double payable, Double payment,String invoice);

    List<House> houses(Integer agreement);

    List<Bill> getPayable(Integer agreement);
}
