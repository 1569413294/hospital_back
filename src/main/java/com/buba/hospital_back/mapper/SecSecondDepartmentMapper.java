package com.buba.hospital_back.mapper;


import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;

public interface SecSecondDepartmentMapper {

    //添加二级科室信息
    Integer add_office(SecSecondDepartment secSecondDepartment);
    //修改二级科室信息
    Integer update_department(SecSecondDepartment secSecondDepartment);
    //判断二级科室是否存在
    Integer is_have_secondDepartmentName(String secondDepartmentName);
}
