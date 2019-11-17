package com.yx.service;

import com.yx.model.ChargeSummary;
import com.yx.model.common.CommonChartModel;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ISummaryService {

    List<CommonChartModel> houseUsedSummary();

    ChargeSummary yearChargeSummary(Date from,Date until);

    List<ChargeSummary> yearChargeSummaryRound(Date from,Date until);

    List<ChargeSummary> monthChargeSummary(Date from,Date until);

    List<CommonChartModel> bannerSummary();

}
