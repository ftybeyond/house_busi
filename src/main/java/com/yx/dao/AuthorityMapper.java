package com.yx.dao;

import com.yx.model.Authority;
import com.yx.model.Role;

import java.util.List;

public interface AuthorityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Authority record);

    Authority selectByPrimaryKey(Integer id);

    List<Authority> selectAll();

    int updateByPrimaryKey(Authority record);

    List<Authority> selectByRole(Role role);
}