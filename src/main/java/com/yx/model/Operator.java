package com.yx.model;

public class Operator {
    private Integer id;

    private String name;

    private Integer region;

    private Integer org;

    private String loginName;

    private String password;

    private Integer state;

    private Integer role;

    private String remark;

    private Role roleObj;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRegion() {
        return region;
    }

    public void setRegion(Integer region) {
        this.region = region;
    }

    public Integer getOrg() {
        return org;
    }

    public void setOrg(Integer org) {
        this.org = org;
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public Role getRoleObj() {
        return roleObj;
    }

    public void setRoleObj(Role roleObj) {
        this.roleObj = roleObj;
    }
}