package com.yx.dao;

import com.yx.model.Accessory;
import java.util.List;
import java.util.Map;

public interface AccessoryMapper {
    int insert(Accessory record);

    List<Accessory> selectAll();

    int deleteByPrimaryKey(Integer id);

    List<Accessory> selectByKey(Map map);

    Accessory loadBinary(Integer id);

    int deleteByKey(Map map);
}