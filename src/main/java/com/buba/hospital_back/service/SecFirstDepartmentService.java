package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.DepartmentVo;
import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;

import java.util.List;

public interface SecFirstDepartmentService {

    //查查询所有科室信息,以及对应医院的医生数量
    List<DepartmentVo> office_all();
    //添添加一级科室以及二级科室信息
    Integer add_office(SecFirstDepartment secFirstDepartment, SecSecondDepartment secSecondDepartment);
    //添加二级科室信息
    Integer add_office_two(SecSecondDepartment secSecondDepartment);
    //判断一级科室是否已存在
    Integer is_have_departmentName(String departmentName);
    //判断二级科室是否存在
    Integer is_have_secondDepartmentName(String secondDepartmentName);
}
