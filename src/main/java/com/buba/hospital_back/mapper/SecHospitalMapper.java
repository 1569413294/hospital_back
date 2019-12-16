package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;

import java.util.List;

public interface SecHospitalMapper {

    //查询指定医院下所有的二级科室
    List<SecSecondDepartment> hospital_change(Integer hospitalId);
}
