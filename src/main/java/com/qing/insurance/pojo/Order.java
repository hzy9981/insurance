package com.qing.insurance.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private Integer orderId;

    private String orderNo;

    private Date finishDate;

    private BigDecimal sumPremium;

    private BigDecimal biPremium;

    private BigDecimal ciPremium;

    private String orderCity;

    private String userName;

    private String carOwner;

    private String enginerNo;

    private String frameNo;

    private String licenceNo;

    public Order(Integer orderId, String orderNo, Date finishDate, BigDecimal sumPremium, BigDecimal biPremium, BigDecimal ciPremium, String orderCity, String userName, String carOwner, String enginerNo, String frameNo, String licenceNo) {
        this.orderId = orderId;
        this.orderNo = orderNo;
        this.finishDate = finishDate;
        this.sumPremium = sumPremium;
        this.biPremium = biPremium;
        this.ciPremium = ciPremium;
        this.orderCity = orderCity;
        this.userName = userName;
        this.carOwner = carOwner;
        this.enginerNo = enginerNo;
        this.frameNo = frameNo;
        this.licenceNo = licenceNo;
    }

    public Order() {
        super();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public BigDecimal getSumPremium() {
        return sumPremium;
    }

    public void setSumPremium(BigDecimal sumPremium) {
        this.sumPremium = sumPremium;
    }

    public BigDecimal getBiPremium() {
        return biPremium;
    }

    public void setBiPremium(BigDecimal biPremium) {
        this.biPremium = biPremium;
    }

    public BigDecimal getCiPremium() {
        return ciPremium;
    }

    public void setCiPremium(BigDecimal ciPremium) {
        this.ciPremium = ciPremium;
    }

    public String getOrderCity() {
        return orderCity;
    }

    public void setOrderCity(String orderCity) {
        this.orderCity = orderCity == null ? null : orderCity.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getCarOwner() {
        return carOwner;
    }

    public void setCarOwner(String carOwner) {
        this.carOwner = carOwner == null ? null : carOwner.trim();
    }

    public String getEnginerNo() {
        return enginerNo;
    }

    public void setEnginerNo(String enginerNo) {
        this.enginerNo = enginerNo == null ? null : enginerNo.trim();
    }

    public String getFrameNo() {
        return frameNo;
    }

    public void setFrameNo(String frameNo) {
        this.frameNo = frameNo == null ? null : frameNo.trim();
    }

    public String getLicenceNo() {
        return licenceNo;
    }

    public void setLicenceNo(String licenceNo) {
        this.licenceNo = licenceNo == null ? null : licenceNo.trim();
    }
}