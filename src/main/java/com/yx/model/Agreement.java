package com.yx.model;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Agreement {
    private Integer id;

    private String title;

    private String content;

    private Double rent;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date signDate;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date effectDate;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    private String contacts1;

    private String contacts2;

    private String contacts1Tel;

    private String contacts2Tel;

    private Integer payRound;

    private String serialNumber;

    private Integer state;

    private Integer chargeTimes;

    private List<Accessory> accessories;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getRent() {
        return rent;
    }

    public void setRent(Double rent) {
        this.rent = rent;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public Date getEffectDate() {
        return effectDate;
    }

    public void setEffectDate(Date effectDate) {
        this.effectDate = effectDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getContacts1() {
        return contacts1;
    }

    public void setContacts1(String contacts1) {
        this.contacts1 = contacts1;
    }

    public String getContacts2() {
        return contacts2;
    }

    public void setContacts2(String contacts2) {
        this.contacts2 = contacts2;
    }

    public String getContacts1Tel() {
        return contacts1Tel;
    }

    public void setContacts1Tel(String contacts1Tel) {
        this.contacts1Tel = contacts1Tel;
    }

    public String getContacts2Tel() {
        return contacts2Tel;
    }

    public void setContacts2Tel(String contacts2Tel) {
        this.contacts2Tel = contacts2Tel;
    }

    public Integer getPayRound() {
        return payRound;
    }

    public void setPayRound(Integer payRound) {
        this.payRound = payRound;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public List<Accessory> getAccessories() {
        return accessories;
    }

    public void setAccessories(List<Accessory> accessories) {
        this.accessories = accessories;
    }

    public Integer getChargeTimes() {
        return chargeTimes;
    }

    public void setChargeTimes(Integer chargeTimes) {
        this.chargeTimes = chargeTimes;
    }
}