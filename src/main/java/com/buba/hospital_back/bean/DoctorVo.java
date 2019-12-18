package com.buba.hospital_back.bean;


import java.util.List;

public class DoctorVo {

    //医生id
    private  Integer id;
    //医生姓名
    private String name;
    //手机号
    private String tel;
    //医院全称
    private List<String> hospitals;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public List<String> getHospitals() {
        return hospitals;
    }

    public void setHospitals(List<String> hospitals) {
        this.hospitals = hospitals;
    }
}
