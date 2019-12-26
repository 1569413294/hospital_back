package com.buba.hospital_back.service;


import com.buba.hospital_back.bean.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface SecDoctorService {


    //查询所有医生
    List<DoctorVo> doctor_all();
    //查询所有医院信息
    List<SecHospital> hospital_all(Integer hospitalId);
    //查询该医院下所有医生
    List<DoctorVo> doctor_al(Integer hospitalId);
    //添加医生信息
    Boolean add_doctor(Integer pid,String[] hos_de, String[] zhucc, SecDoctor secDoctor, MultipartFile file);
    //查询回显医生数据
    DoctorVo2 doctor_xq(Integer id);
    //删除医生对应的医院以及科室信息
    Boolean delete_h_d(Integer id);
    //删除医生下对应的助理
    Boolean delete_zhu(Integer id);
    /* *
     * 功能概述：添加医生<br>
     * <>
     * @Param: [doctor]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 11:25
     */
    int addDoctors(AddDoctor addDoctor);
}
