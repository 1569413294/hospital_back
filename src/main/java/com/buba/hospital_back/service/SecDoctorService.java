package com.buba.hospital_back.service;


import com.buba.hospital_back.bean.DoctorVo;
import com.buba.hospital_back.bean.SecDoctor;
import com.buba.hospital_back.bean.SecHospital;
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
    Boolean add_doctor(String[] hos_de, Integer[] zhucc, SecDoctor secDoctor, MultipartFile file);
}
