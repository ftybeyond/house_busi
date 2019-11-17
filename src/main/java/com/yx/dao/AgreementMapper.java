package com.yx.dao;

import com.yx.common.PageProxy;
import com.yx.model.Agreement;
import java.util.List;

public interface AgreementMapper extends BaseMapper{
    int deleteByPrimaryKey(Integer id);

    int insert(Agreement record);

    Agreement selectByPrimaryKey(Integer id);

    List<Agreement> selectAll();

    int updateByPrimaryKey(Agreement record);

    int updateState(Agreement agreement);

    int selectCountByPage(PageProxy pageProxy);

    List<Agreement> selectByPage(PageProxy pageProxy);

    String selectContentById(Integer id);

}