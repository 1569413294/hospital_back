package com.buba.hospital_back.bean;

public class Selectyyjs {
    private  Integer id;
    private   String hospitalAddress;//医院 地址
    private  String hospitalTel;//医院  电话
    private Integer hospitalId;//医院 id


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHospitalAddress() {
        return hospitalAddress;
    }

    public void setHospitalAddress(String hospitalAddress) {
        this.hospitalAddress = hospitalAddress;
    }

    public String getHospitalTel() {
        return hospitalTel;
    }

    public void setHospitalTel(String hospitalTel) {
        this.hospitalTel = hospitalTel;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    @Override
    public String toString() {
        return "Selectyyjs{" +
                "id=" + id +
                ", hospitalAddress='" + hospitalAddress + '\'' +
                ", hospitalTel='" + hospitalTel + '\'' +
                ", hospitalId=" + hospitalId +
                '}';
    }
}
