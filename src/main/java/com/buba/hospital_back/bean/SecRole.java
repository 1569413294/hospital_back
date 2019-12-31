package com.buba.hospital_back.bean;

import java.util.Date;

public class SecRole {
    private Integer id;

    private String status;

    private Boolean disabled;


    private Date createtime;

    private String roleName;

    private String roleCode;

    private Integer sequence;

    private String roleInfo;

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

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getRoleInfo() {
        return roleInfo;
    }

    public void setRoleInfo(String roleInfo) {
        this.roleInfo = roleInfo == null ? null : roleInfo.trim();
    }

    @Override
    public String toString() {
        return "SecRole{" +
                "id=" + id +
                ", status='" + status + '\'' +
                ", disabled=" + disabled +
                ", createtime=" + createtime +
                ", roleName='" + roleName + '\'' +
                ", roleCode='" + roleCode + '\'' +
                ", sequence=" + sequence +
                ", roleInfo='" + roleInfo + '\'' +
                '}';
    }
}