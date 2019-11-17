package com.yx.dao;

import com.yx.model.Operator;
import java.util.List;

public interface OperatorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Operator record);

    Operator selectByPrimaryKey(Integer id);

    List<Operator> selectAll();

    int updateByPrimaryKey(Operator record);

    int updatePassword(Operator operator);

    Operator selectByLoginName(String loginName);
}