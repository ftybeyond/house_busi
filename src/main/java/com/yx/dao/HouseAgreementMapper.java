package com.yx.dao;

import com.yx.model.HouseAgreement;
import java.util.List;

public interface HouseAgreementMapper {
    int insert(HouseAgreement record);

    List<HouseAgreement> selectAll();

    int delete(HouseAgreement houseAgreement);
}