package com.yx.dao;

import com.yx.common.PageProxy;
import com.yx.model.Log;
import java.util.List;

public interface LogMapper {
    int insert(Log record);

    List<Log> selectAll();

    List<Log> selectByPage(PageProxy pageProxy);

    int selectTableCount(PageProxy pageProxy);
}