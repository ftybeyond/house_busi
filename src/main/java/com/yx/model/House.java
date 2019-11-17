package com.yx.model;

public class House {
    private Integer id;

    private String houseNumber;

    private Integer nature;

    private Double area;

    private Integer houseType;

    private Integer agreement;

    private Integer decorate;

    private Integer region;

    private String layout;

    private String remark;

    private String certificate;

    private String owner;

    private String houseCode;

    Agreement agreementObj;

    String regionPath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public Integer getNature() {
        return nature;
    }

    public void setNature(Integer nature) {
        this.nature = nature;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getHouseType() {
        return houseType;
    }

    public void setHouseType(Integer houseType) {
        this.houseType = houseType;
    }

    public Integer getAgreement() {
        return agreement;
    }

    public void setAgreement(Integer agreement) {
        this.agreement = agreement;
    }

    public Integer getDecorate() {
        return decorate;
    }

    public void setDecorate(Integer decorate) {
        this.decorate = decorate;
    }

    public Integer getRegion() {
        return region;
    }

    public void setRegion(Integer region) {
        this.region = region;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getHouseCode() {
        return houseCode;
    }

    public void setHouseCode(String houseCode) {
        this.houseCode = houseCode;
    }

    public String getRegionPath() {
        return regionPath;
    }

    public void setRegionPath(String regionPath) {
        this.regionPath = regionPath;
    }

    public Agreement getAgreementObj() {
        return agreementObj;
    }

    public void setAgreementObj(Agreement agreementObj) {
        this.agreementObj = agreementObj;
    }
}