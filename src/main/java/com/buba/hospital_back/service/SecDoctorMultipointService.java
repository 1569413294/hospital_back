package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecDoctorMultipoint;

public interface SecDoctorMultipointService {
    /* *
     * 功能概述：添加医生与医院的关联表<br>
     * <>
     * @Param: [secDoctorMultipoint]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 11:44
     */
    int addSecDoctorMultipointMapper(AddDoctor addDoctor);
}
