package com.yx.model.common;

import java.util.Map;

public class UpdateMap {

    String tableName;

    Integer id;

    Map props;

    public UpdateMap(String tableName, Integer id,Map props) {
        this.tableName = tableName;
        this.id = id;
        this.props =props;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Map getProps() {
        return props;
    }

    public void setProps(Map props) {
        this.props = props;
    }
}
