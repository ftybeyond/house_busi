package com.yx.service;

import com.yx.model.Region;

import java.util.List;

public interface IRegionService {

    public List<Region> list(Integer pid);

    public int insert(Region region);

    public int deleteByPrimaryKey(Integer id);

    public int update(Region region);

    public int mark(Integer id,String point);

    public List<Region> querySelect2Data(Region region);

}
