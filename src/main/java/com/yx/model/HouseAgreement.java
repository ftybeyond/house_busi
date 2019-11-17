package com.yx.model;

import java.util.Date;

public class HouseAgreement {
    private Date stamp;

    private Integer agreement;

    private Integer house;

    private Integer id;

    public Date getStamp() {
        return stamp;
    }

    public void setStamp(Date stamp) {
        this.stamp = stamp;
    }

    public Integer getAgreement() {
        return agreement;
    }

    public void setAgreement(Integer agreement) {
        this.agreement = agreement;
    }

    public Integer getHouse() {
        return house;
    }

    public void setHouse(Integer house) {
        this.house = house;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}