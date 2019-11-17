package com.yx.dao;

import com.yx.model.Region;
import java.util.List;

public interface RegionMapper extends BaseMapper{
    int deleteByPrimaryKey(Integer id);

    int insert(Region record);

    Region selectByPrimaryKey(Integer id);

    List<Region> selectAll();

    int updateByPrimaryKey(Region record);

    List<Region> selectByPid(Integer region);

    List<Region> selectBranch(Integer region);

    List<Region> selectChildren(Integer region);

    List<Region> querySelect2Data(Region region);
}