package com.yx.service.impl;

import com.yx.dao.SummaryMapper;
import com.yx.model.ChargeSummary;
import com.yx.model.common.CommonChartModel;
import com.yx.service.ISummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SummaryService implements ISummaryService {

    @Autowired
    SummaryMapper summaryMapper;

    @Override
    public List<CommonChartModel> houseUsedSummary() {
        return summaryMapper.houseUsedSummary();
    }

    @Override
    public ChargeSummary yearChargeSummary(Date from, Date until) {
        Map<String,Date> params = new HashMap<>();
        params.put("from",from);
        params.put("until",until);
        return summaryMapper.yearChargeSummary(params);
    }

    @Override
    public List<ChargeSummary> yearChargeSummaryRound(Date from, Date until) {
        Map<String,Date> params = new HashMap<>();
        params.put("from",from);
        params.put("until",until);
        return summaryMapper.yearChargeSummaryRound(params);
    }

    @Override
    public List<ChargeSummary> monthChargeSummary(Date from, Date until) {
        Map<String,Date> params = new HashMap<>();
        params.put("from",from);
        params.put("until",until);
        return summaryMapper.monthChargeSummary(params);
    }

    @Override
    public List<CommonChartModel> bannerSummary() {
        List<CommonChartModel> list = new ArrayList<>();
        list.add(new CommonChartModel("housesCount",summaryMapper.housesCount().toString()));
        Double housesAreaCount = summaryMapper.housesAreaCount();
        list.add(new CommonChartModel("housesAreaCount",housesAreaCount==null?String.valueOf(0f):housesAreaCount.toString()));
        list.add(new CommonChartModel("idleHousesCount",summaryMapper.idleHousesCount().toString()));
        return list;
    }


}
