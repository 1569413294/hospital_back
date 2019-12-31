package com.buba.hospital_back.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author FJ
 * @title: ReservationVo
 * @projectName hospital_back
 * @date 2019/12/1110:27
 */
public class ReservationVo {
    private Integer id;
    private String patientName;//就诊人
    private String patientTel;//手机号
    private String patientMedicalcardnumber;//就诊卡号
    private String timeframe;//时间段
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date appointmentTime;//预约时间
    private String doctorName;//医生
    private String departmentName;//科室名称
    private String hospitalName;//医院名称
    private String orderNum;//订单号
    private String orderName;//订单名称
    private double payMoney;//订单金额
    private String payWay;//支付方式
    private Date payStartTime;//支付时间
    private String orderStatus;//订单状态

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientTel() {
        return patientTel;
    }

    public void setPatientTel(String patientTel) {
        this.patientTel = patientTel;
    }

    public String getPatientMedicalcardnumber() {
        return patientMedicalcardnumber;
    }

    public void setPatientMedicalcardnumber(String patientMedicalcardnumber) {
        this.patientMedicalcardnumber = patientMedicalcardnumber;
    }

    public String getTimeframe() {
        return timeframe;
    }

    public void setTimeframe(String timeframe) {
        this.timeframe = timeframe;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(double payMoney) {
        this.payMoney = payMoney;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public Date getPayStartTime() {
        return payStartTime;
    }

    public void setPayStartTime(Date payStartTime) {
        this.payStartTime = payStartTime;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
}
