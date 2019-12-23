package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecHospital;
import com.buba.hospital_back.bean.SecSecondDepartment;

import java.util.List;

public interface SecHospitalService {

    //查询指定医院下的二级科室
    List<SecSecondDepartment> hospital_change(Integer hospitalId);
    /* *
     * 功能概述：//所属医院<br>
     * <>
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.mapper.SecHospital>
     * @Author: Administrator
     * @Date: 2019/12/12 8:30
     */
    List<SecHospital> allHospital();
}
