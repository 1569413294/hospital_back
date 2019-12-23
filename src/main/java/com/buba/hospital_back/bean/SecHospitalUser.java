package com.buba.hospital_back.bean;

public class SecHospitalUser {
    private Integer id;

    private Integer hospitalId;

    private Integer adminId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    @Override
    public String toString() {
        return "SecHospitalUser{" +
                "id=" + id +
                ", hospitalId=" + hospitalId +
                ", adminId=" + adminId +
                '}';
    }
}