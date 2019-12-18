package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;

import java.util.List;

public interface SecHospitalService {

    //查询指定医院下的二级科室
    List<SecSecondDepartment> hospital_change(Integer hospitalId);
}
