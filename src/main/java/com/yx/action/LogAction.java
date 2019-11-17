package com.yx.action;

import com.yx.common.Constant;
import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Log;
import com.yx.model.common.CommonRsp;
import com.yx.model.common.Select2;
import com.yx.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@ResponseBody
@RequestMapping(value = "log")
public class LogAction {

    @Autowired
    ILogService logService;

    @RequestMapping(value = "eventType",method = RequestMethod.POST)
    public List<Select2> eventType(){
        List<Select2> select2List = new ArrayList<>();
        for (Integer id: Constant.LOG_EVENT.keySet()){
            Select2 select2 = new Select2(id,Constant.LOG_EVENT.get(id));
            select2List.add(select2);
        }
        return select2List;
    }

    @RequestMapping(value = "table",method = RequestMethod.POST)
    public DataTableRspWrapper<Log> table(PageProxy pageProxy){
        return logService.table(pageProxy);
    }
}
