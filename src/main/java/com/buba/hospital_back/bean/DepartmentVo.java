package com.buba.hospital_back.bean;

public class DepartmentVo {
    private Integer id;
    //二级科室id
    private Integer id2;
    //一级科室名称
    private String departmentName;
    //二级科室名称
    private String secondDepartmentName;
    //一级科室排序
    private Integer sequence;
    //对应医生数量
    private Integer count;

    private String secondDepartmentAddress;

    private String secondDepartmentCommont;

    private Integer sequence2;

    public String getSecondDepartmentAddress() {
        return secondDepartmentAddress;
    }

    public void setSecondDepartmentAddress(String secondDepartmentAddress) {
        this.secondDepartmentAddress = secondDepartmentAddress;
    }

    public String getSecondDepartmentCommont() {
        return secondDepartmentCommont;
    }

    public void setSecondDepartmentCommont(String secondDepartmentCommont) {
        this.secondDepartmentCommont = secondDepartmentCommont;
    }

    public Integer getSequence2() {
        return sequence2;
    }

    public void setSequence2(Integer sequence2) {
        this.sequence2 = sequence2;
    }

    public Integer getId2() {
        return id2;
    }

    public void setId2(Integer id2) {
        this.id2 = id2;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getSecondDepartmentName() {
        return secondDepartmentName;
    }

    public void setSecondDepartmentName(String secondDepartmentName) {
        this.secondDepartmentName = secondDepartmentName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
