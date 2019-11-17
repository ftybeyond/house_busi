package com.yx.service;

import com.yx.common.DataTableRspWrapper;
import com.yx.common.PageProxy;
import com.yx.model.Log;

import javax.servlet.http.HttpSession;

public interface ILogService {

    public int log(Integer event, String description, String belong, HttpSession sessionr);

    public DataTableRspWrapper<Log> table(PageProxy pageProxy);
}
