package com.yx.service;

import com.yx.common.PageProxy;
import com.yx.model.Operator;

import java.util.List;

public interface IOperatorService {

    public List<Operator> table(PageProxy pageProxy);

    public int insert(Operator operator);

    public int delete(Integer id);

    public int update(Operator operator);

    int updatePassword(Operator operator);

    Operator selectByLoginName(String loginName);

    Operator selectById(Integer id);
}
