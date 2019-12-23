package com.buba.hospital_back.bean;
/*介绍：
    后台管理-->用户管理

    */
public class SelectUrhdm {
    //用户id
    private  Integer id;
    //用户名
private  String username;
//状态码
private  Integer disabled;
//医院全称
private  String hospitalName;
//角色
    private String roleName;
//用户表id
    private  String phone;
//医院与用户关联表id
    private Integer huId;
//角色ID
    private Integer roleId;
 //医院id
    private Integer hospitalId;

    public SelectUrhdm(Integer id, String username, Integer disabled, String hospitalName, String roleName, String phone, Integer huId, Integer roleId, Integer hospitalId) {
        this.id = id;
        this.username = username;
        this.disabled = disabled;
        this.hospitalName = hospitalName;
        this.roleName = roleName;
        this.phone = phone;
        this.huId = huId;
        this.roleId = roleId;
        this.hospitalId = hospitalId;
    }

    public SelectUrhdm() {
        super();
    }
    public Integer getHuId() {
        return huId;
    }

    public void setHuId(Integer huId) {
        this.huId = huId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Integer getDisabled() {
        return disabled;
    }

    public void setDisabled(Integer disabled) {
        this.disabled = disabled;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "SelectUrhdm{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", disabled=" + disabled +
                ", hospitalName='" + hospitalName + '\'' +
                ", roleName='" + roleName + '\'' +
                ", phone='" + phone + '\'' +
                ", huId=" + huId +
                ", roleId=" + roleId +
                ", hospitalId=" + hospitalId +
                '}';
    }
}
