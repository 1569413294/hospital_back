package com.buba.hospital_back.bean;

import java.util.Date;

public class SecSecondDepartment {
    private Integer id;

    private String status;

    private Boolean disabled;

    private Date createtime;

    private Integer firstDepartmentId;

    private String secondDepartmentName;

    private Integer sequence;

    private String secondDepartmentAddress;

    private String secondDepartmentCommont;

    private Integer sequence2;

    public Integer getSequence2() {
        return sequence2;
    }

    public void setSequence2(Integer sequence2) {
        this.sequence2 = sequence2;
    }

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

    public Integer getFirstDepartmentId() {
        return firstDepartmentId;
    }

    public void setFirstDepartmentId(Integer firstDepartmentId) {
        this.firstDepartmentId = firstDepartmentId;
    }

    public String getSecondDepartmentName() {
        return secondDepartmentName;
    }

    public void setSecondDepartmentName(String secondDepartmentName) {
        this.secondDepartmentName = secondDepartmentName == null ? null : secondDepartmentName.trim();
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getSecondDepartmentAddress() {
        return secondDepartmentAddress;
    }

    public void setSecondDepartmentAddress(String secondDepartmentAddress) {
        this.secondDepartmentAddress = secondDepartmentAddress == null ? null : secondDepartmentAddress.trim();
    }

    public String getSecondDepartmentCommont() {
        return secondDepartmentCommont;
    }

    public void setSecondDepartmentCommont(String secondDepartmentCommont) {
        this.secondDepartmentCommont = secondDepartmentCommont == null ? null : secondDepartmentCommont.trim();
    }
}