package com.yx.model.common;

import com.alibaba.fastjson.annotation.JSONField;

public class ZTreeModel {

    private Integer id;

    private String name;

    private String idPath;

    private String namePath;

    private Integer parentId;

    private String isParent;

    @JSONField(serialize = false)
    private Integer children;

    private String remark;

    private Integer level;

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

    public String getIdPath() {
        return idPath;
    }

    public void setIdPath(String idPath) {
        this.idPath = idPath;
    }

    public String getNamePath() {
        return namePath;
    }

    public void setNamePath(String namePath) {
        this.namePath = namePath;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getChildren() {
        return children;
    }

    public void setChildren(Integer children) {
        this.children = children;
    }

    public String getIsParent() {
        if(this.children!=null && this.children>0){
            this.isParent="true";
        }else{
            this.isParent="false";
        }
        return isParent;
    }

    public void setIsParent(String isParent) {
        this.isParent = isParent;
    }
}
