package com.yx.common;

import java.util.HashMap;
import java.util.Map;

public class Constant {
    public static Map<Integer,String> LOG_EVENT = new HashMap<>();

    static {
        LOG_EVENT.put(0,"用户登录");
        LOG_EVENT.put(1,"添加合同");
        LOG_EVENT.put(2,"更新合同");
        LOG_EVENT.put(3,"删除合同");
        LOG_EVENT.put(4,"合同履行");
        LOG_EVENT.put(5,"合同解除");
        LOG_EVENT.put(6,"合同终止");
        LOG_EVENT.put(7,"合同关联");
        LOG_EVENT.put(8,"合同收缴");
        LOG_EVENT.put(9,"房屋添加");
        LOG_EVENT.put(10,"房屋信息修改");
        LOG_EVENT.put(11,"房屋删除");
        LOG_EVENT.put(12,"区域添加");
        LOG_EVENT.put(13,"区域信息修改");
        LOG_EVENT.put(14,"区域删除");
        LOG_EVENT.put(15,"区域标注");
        LOG_EVENT.put(16,"用户添加");
        LOG_EVENT.put(17,"用户修改");
        LOG_EVENT.put(18,"用户删除");
        LOG_EVENT.put(19,"密码修改");
        LOG_EVENT.put(20,"角色添加");
        LOG_EVENT.put(21,"角色修改");
        LOG_EVENT.put(22,"角色删除");
    }
}
