package com.yx.service.impl;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.dao.LogMapper;
import com.yx.model.Log;
import com.yx.model.Operator;
import com.yx.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Service
@Transactional
public class LogService implements ILogService {

    @Autowired
    LogMapper logMapper;

    @Override
    public int log(Integer event, String description, String belong, HttpSession sessionr) {
        Operator operator = (Operator) sessionr.getAttribute("op");
        Log log = new Log();
        log.setBelong(belong);
        log.setDescription(description);
        log.setEvent(event);
        log.setOperator(operator.getId());
        log.setOperatorName(operator.getName());
        log.setStamp(new Date());
        return logMapper.insert(log);
    }

    @Override
    public DataTableRspWrapper<Log> table(PageProxy pageProxy) {
        DataTableRspWrapper<Log> rspWrapper = new DataTableRspWrapper<>();
        rspWrapper.setData(logMapper.selectByPage(pageProxy));
        rspWrapper.setRecordsTotal(logMapper.selectTableCount(pageProxy));
        return rspWrapper;
    }
}
