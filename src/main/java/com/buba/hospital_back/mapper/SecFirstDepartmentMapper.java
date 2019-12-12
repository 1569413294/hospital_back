package com.buba.hospital_back.mapper;


import com.buba.hospital_back.bean.DepartmentVo;
import com.buba.hospital_back.bean.SecFirstDepartment;

import java.util.List;

public interface SecFirstDepartmentMapper {
    //查询所有科室信息,以及对应医院的医生数量
    List<DepartmentVo> office_all();
    //添加一级科室以及二级科室信息
    Integer add_office(SecFirstDepartment secFirstDepartment);
    //判断一级科室是否存在
    Integer is_have_departmentName(String departmentName);
}
