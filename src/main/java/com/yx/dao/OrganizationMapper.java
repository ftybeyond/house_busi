package com.yx.dao;

import com.yx.model.Organization;
import java.util.List;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Organization record);

    Organization selectByPrimaryKey(Integer id);

    List<Organization> selectAll();

    int updateByPrimaryKey(Organization record);
}