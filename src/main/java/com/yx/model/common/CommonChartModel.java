package com.yx.model.common;

public class CommonChartModel {

    String name;

    String value;

    public CommonChartModel(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public CommonChartModel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
