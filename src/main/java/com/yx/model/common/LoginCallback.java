package com.yx.model.common;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class LoginCallback {

    Integer id;

    String loginName;

    String password;

    String usbKey;

    Integer sysFrom;

    String authority;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date Stamp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsbKey() {
        return usbKey;
    }

    public void setUsbKey(String usbKey) {
        this.usbKey = usbKey;
    }

    public Integer getSysFrom() {
        return sysFrom;
    }

    public void setSysFrom(Integer sysFrom) {
        this.sysFrom = sysFrom;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public Date getStamp() {
        return Stamp;
    }

    public void setStamp(Date stamp) {
        Stamp = stamp;
    }
}
