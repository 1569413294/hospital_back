package com.buba.hospital_back.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class DoctorVo2 {

    private Integer id;

    private String status;

    private Boolean disabled;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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

    private List<SecDoctorMultipoint>  mlist;

    private List<SecDoctorAssistant> alist;

    private Integer pid;

    private String picPath;

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
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
        this.status = status;
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
        this.name = name;
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
        this.tel = tel;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getVisitplaces() {
        return visitplaces;
    }

    public void setVisitplaces(String visitplaces) {
        this.visitplaces = visitplaces;
    }

    public String getVisitaddress() {
        return visitaddress;
    }

    public void setVisitaddress(String visitaddress) {
        this.visitaddress = visitaddress;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getAdeptat() {
        return adeptat;
    }

    public void setAdeptat(String adeptat) {
        this.adeptat = adeptat;
    }

    public Boolean getOnlineconsultant() {
        return onlineconsultant;
    }

    public void setOnlineconsultant(Boolean onlineconsultant) {
        this.onlineconsultant = onlineconsultant;
    }

    public Boolean getIspremium() {
        return ispremium;
    }

    public void setIspremium(Boolean ispremium) {
        this.ispremium = ispremium;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public List<SecDoctorMultipoint> getMlist() {
        return mlist;
    }

    public void setMlist(List<SecDoctorMultipoint> mlist) {
        this.mlist = mlist;
    }

    public List<SecDoctorAssistant> getAlist() {
        return alist;
    }

    public void setAlist(List<SecDoctorAssistant> alist) {
        this.alist = alist;
    }
}
