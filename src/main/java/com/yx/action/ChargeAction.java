package com.yx.action;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Bill;
import com.yx.model.common.CommonRsp;
import com.yx.service.IChargeService;
import com.yx.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/charge")
@ResponseBody
public class ChargeAction extends BaseAction {

    @Autowired
    IChargeService chargeService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public DataTableRspWrapper<Bill> chargeList(PageProxy pageProxy){
        if(pageProxy.getParams()==null){
            Map params= new HashMap();
            pageProxy.setParams(params);
        }
        pageProxy.getParams().put("state",0);
        pageProxy.getParams().put("fromDate",new Date());
        return chargeService.list(pageProxy);
    }

    @RequestMapping(value = "/do",method = RequestMethod.POST)
    public CommonRsp doCharge(Bill bill, HttpSession session){
        int effect = chargeService.doCharge(bill);
        if(effect >0){
            logService.log(7, "合同收缴：合同ID" + bill.getAgreement() +"收缴金额：" + bill.getPayment(), "合同管理", session);
        }
        return dbEffect2Rsp(effect);
    }

    @RequestMapping(value = "/payable",method = RequestMethod.POST)
    public DataTableRspWrapper<Bill> payable(PageProxy pageProxy){
        return chargeService.list(pageProxy);
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public CommonRsp updateBill(Bill bill){
        return dbEffect2Rsp(chargeService.updateBill(bill));
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public CommonRsp updateBill(Integer id){
        return dbEffect2Rsp(chargeService.deleteById(id));
    }

}
