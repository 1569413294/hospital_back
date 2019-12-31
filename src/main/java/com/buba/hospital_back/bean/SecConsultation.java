package com.buba.hospital_back.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class SecConsultation {
    private Integer id;

    private String status;

    private Boolean disabled;
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date createtime;

    private Integer orderId;

    private Integer patientId;

    private String questionTitle;

    private Integer sex;

    private String illnessDescription;

    private String paymentStatus;

    private Integer doctorId;

    private Integer responseId;

    private String response;
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date responseTime;

    private double payMoney;//支付金额

    private String name;//署名医生
    private String name1;//回答医生
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date payStartTime;//支付时间
    private String payWay;//支付方式
    private String status1;//订单状态
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    private Date refundStartTime;//退款时间

    private String orderNum;//订单号
    private List<SecPic> secPic;//图片

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getDisabled() {
        return disabled;
    }

    public void setDisabled(Boolean disabled) {
        this.disabled = disabled;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getIllnessDescription() {
        return illnessDescription;
    }

    public void setIllnessDescription(String illnessDescription) {
        this.illnessDescription = illnessDescription;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Integer getResponseId() {
        return responseId;
    }

    public void setResponseId(Integer responseId) {
        this.responseId = responseId;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public Date getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(Date responseTime) {
        this.responseTime = responseTime;
    }

    public double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(double payMoney) {
        this.payMoney = payMoney;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getPayStartTime() {
        return payStartTime;
    }

    public void setPayStartTime(Date payStartTime) {
        this.payStartTime = payStartTime;
    }
    public Date getRefundStartTime() {
        return refundStartTime;
    }

    public void setRefundStartTime(Date refundStartTime) {
        this.refundStartTime = refundStartTime;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getName1() {
        return name1;
    }

    public void setName1(String name1) {
        this.name1 = name1;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getStatus1() {
        return status1;
    }

    public void setStatus1(String status1) {
        this.status1 = status1;
    }

    public List<SecPic> getSecPic() {
        return secPic;
    }

    public void setSecPic(List<SecPic> secPic) {
        this.secPic = secPic;
    }
}