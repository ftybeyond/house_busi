package com.yx.dao;

import com.yx.common.PageProxy;
import com.yx.model.House;
import java.util.List;

public interface HouseMapper extends BaseMapper{

    int deleteByPrimaryKey(Integer id);

    int insert(House record);

    House selectByPrimaryKey(Integer id);

    List<House> selectAll();

    int updateByPrimaryKey(House record);

    List<House> selectByPage(PageProxy pageProxy);

    int selectCountByPage(PageProxy pageProxy);

    int selectCountWithAgreement(PageProxy pageProxy);

    List<House> selectWithAgreementByPage(PageProxy pageProxy);

    List<House> selectByAgreement(Integer agreement);

    int relieveAgreement(Integer agreement);
}