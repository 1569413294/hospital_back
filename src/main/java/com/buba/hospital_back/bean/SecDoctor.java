package com.buba.hospital_back.bean;

import java.util.Date;

public class SecDoctor {
    private Integer id;

    private String status;

    private Boolean disabled;

    private Date createtime;

    private String name;

    private Boolean assistant;

    private Boolean display;

    private String tel;

    private String rank;

    private String visitplaces;

    private String visitaddress;

    private String introduce;

    private String adeptat;

    private Boolean onlineconsultant;

    private Boolean ispremium;

    private Double price;

    private Integer creator;


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getAssistant() {
        return assistant;
    }

    public void setAssistant(Boolean assistant) {
        this.assistant = assistant;
    }

    public Boolean getDisplay() {
        return display;
    }

    public void setDisplay(Boolean display) {
        this.display = display;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }


    public String getRank() {
        return rank;
    }



}