package com.buba.hospital_back.bean;

/**
 * @ClassName SecHospitalArticleType
 * @Description TODO
 * @Created by Administrator on 2019/12/16 11:22
 * @Version 1.0
 **/
public class SecHospitalArticleType {


    private Integer id;

    private String code;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "SecHospitalArticleType{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
