package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecDoctorMultipoint;

public interface SecDoctorMultipointMapper {


    //添加医生医院科室关联表
    Integer add_ho_de(SecDoctorMultipoint secDoctorMultipoint);
    //删除医生对应的医院以及科室信息
    Boolean delete_h_d(Integer id);
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
