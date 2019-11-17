package com.yx.service;


import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.House;

import java.util.List;

public interface IHouseService {

    public List<House> list(Integer pid);

    public int insert(House house);

    public int deleteByPrimaryKey(Integer id);

    public int update(House house);

    public DataTableRspWrapper<House> table(PageProxy pageProxy);

    public int relateAgreement(Integer[] house,Integer agreement);

    DataTableRspWrapper<House> leaseList(PageProxy pageProxy);
}
