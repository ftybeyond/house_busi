package com.yx.action;

import com.yx.common.DateHelper;
import com.yx.model.common.CommonRsp;
import com.yx.service.ISummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.activation.DataHandler;
import java.util.Date;

@Controller
@RequestMapping("summary")
@ResponseBody
public class SummaryAction extends BaseAction{

    @Autowired
    ISummaryService summaryService;

    @RequestMapping(value = "houseUsed",method = RequestMethod.POST)
    public CommonRsp houseUsed(){
        Date from = DateHelper.firstDayOfYear();
        Date until = DateHelper.lastDayOfYear();
        return data2Rsp(summaryService.houseUsedSummary());
    }

    @RequestMapping(value = "monthChargeSummary",method = RequestMethod.POST)
    public CommonRsp monthChargeSummary() {
        Date from = DateHelper.firstDayOfYear();
        Date until = DateHelper.lastDayOfYear();
        return data2Rsp(summaryService.monthChargeSummary(from,until));
    }

    @RequestMapping(value = "yearChargeSummary",method = RequestMethod.POST)
    public CommonRsp yearChargeSummary() {
        Date from = DateHelper.firstDayOfYear();
        Date until = DateHelper.lastDayOfYear();
        return data2Rsp(summaryService.yearChargeSummary(from,until));
    }

    @RequestMapping(value = "yearChargeSummaryRound",method = RequestMethod.POST)
    public CommonRsp yearChargeSummaryRound() {
        Date from = DateHelper.firstDayOfYear();
        Date until = DateHelper.lastDayOfYear();
        return data2Rsp(summaryService.yearChargeSummaryRound(DateHelper.addYears(from,-3),until));
    }

    @RequestMapping(value = "bannerSummary",method = RequestMethod.POST)
    public CommonRsp banner(){
        return data2Rsp(summaryService.bannerSummary());
    }
}
