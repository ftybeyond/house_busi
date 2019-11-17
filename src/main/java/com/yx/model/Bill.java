package com.yx.model;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Bill {
    private Date stamp;

    private Integer agreement;

    private Double payable;

    private Double payment;

    private String remark;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountPeriod;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date chargeDate;

    private Integer id;

    private Integer state;

    private String invoice;

    private House houseObj;

    private Agreement agreementObj;

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

    public Double getPayable() {
        return payable;
    }

    public void setPayable(Double payable) {
        this.payable = payable;
    }

    public Double getPayment() {
        return payment;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getAccountPeriod() {
        return accountPeriod;
    }

    public void setAccountPeriod(Date accountPeriod) {
        this.accountPeriod = accountPeriod;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public House getHouseObj() {
        return houseObj;
    }

    public void setHouseObj(House houseObj) {
        this.houseObj = houseObj;
    }

    public Agreement getAgreementObj() {
        return agreementObj;
    }

    public void setAgreementObj(Agreement agreementObj) {
        this.agreementObj = agreementObj;
    }

    public Date getChargeDate() {
        return chargeDate;
    }

    public void setChargeDate(Date chargeDate) {
        this.chargeDate = chargeDate;
    }
}