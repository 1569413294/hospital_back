package com.buba.hospital_back.bean;

import java.io.StringReader;

public class SelectYygl {
    private Integer id;
    private String hospitalName;//医院全称
    private String hospitalSort;//医院简称
    private String username;//管理员
    private Integer count;//医生数量
    private  String roleName;
    private String creator;//登陆者id




    public SelectYygl(Integer id, String hospitalName, String hospitalSort, String username, Integer count, String roleName, String creator) {
        this.id = id;
        this.hospitalName = hospitalName;
        this.hospitalSort = hospitalSort;
        this.username = username;
        this.count = count;
        this.roleName = roleName;
        this.creator = creator;
    }

    public SelectYygl() {
        super();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getHospitalSort() {
        return hospitalSort;
    }

    public void setHospitalSort(String hospitalSort) {
        this.hospitalSort = hospitalSort;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "SelectYygl{" +
                "id=" + id +
                ", hospitalName='" + hospitalName + '\'' +
                ", hospitalSort='" + hospitalSort + '\'' +
                ", username='" + username + '\'' +
                ", count=" + count +
                ", roleName='" + roleName + '\'' +
                ", creator='" + creator + '\'' +
                '}';
    }
}
