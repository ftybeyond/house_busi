package com.yx.dao;

import com.yx.model.ChargeSummary;
import com.yx.model.common.CommonChartModel;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SummaryMapper {

    List<CommonChartModel> houseUsedSummary();

    ChargeSummary yearChargeSummary(Map<String,Date> params);

    List<ChargeSummary> yearChargeSummaryRound(Map<String,Date> params);

    List<ChargeSummary> monthChargeSummary(Map<String,Date> params);

    Integer housesCount();

    Integer idleHousesCount();

    Double housesAreaCount();
}
