package com.buba.hospital_back.bean;

import java.util.Date;
//就诊人表
public class SecPatient {
    private Integer id;

    private String status;

    private Boolean disabled;

    private Date createtime;

    private Integer userId;

    private String patientName;

    private String patientTel;

    private String patientIdcard;

    private String patientMedicalcardnumber;

    private String patientHealthcarecardnumber;

    private String patientArea;

    private String patientAddress;

    private Boolean isDefault;

    private Double medicalcardBalance;

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
        this.status = status == null ? null : status.trim();
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName == null ? null : patientName.trim();
    }

    public String getPatientTel() {
        return patientTel;
    }

    public void setPatientTel(String patientTel) {
        this.patientTel = patientTel == null ? null : patientTel.trim();
    }

    public String getPatientIdcard() {
        return patientIdcard;
    }

    public void setPatientIdcard(String patientIdcard) {
        this.patientIdcard = patientIdcard == null ? null : patientIdcard.trim();
    }

    public String getPatientMedicalcardnumber() {
        return patientMedicalcardnumber;
    }

    public void setPatientMedicalcardnumber(String patientMedicalcardnumber) {
        this.patientMedicalcardnumber = patientMedicalcardnumber == null ? null : patientMedicalcardnumber.trim();
    }

    public String getPatientHealthcarecardnumber() {
        return patientHealthcarecardnumber;
    }

    public void setPatientHealthcarecardnumber(String patientHealthcarecardnumber) {
        this.patientHealthcarecardnumber = patientHealthcarecardnumber == null ? null : patientHealthcarecardnumber.trim();
    }

    public String getPatientArea() {
        return patientArea;
    }

    public void setPatientArea(String patientArea) {
        this.patientArea = patientArea == null ? null : patientArea.trim();
    }

    public String getPatientAddress() {
        return patientAddress;
    }

    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress == null ? null : patientAddress.trim();
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }

    public Double getMedicalcardBalance() {
        return medicalcardBalance;
    }

    public void setMedicalcardBalance(Double medicalcardBalance) {
        this.medicalcardBalance = medicalcardBalance;
    }
}