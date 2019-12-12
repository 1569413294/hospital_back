package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;

public interface SecSecondDepartmentService {
    //修改二级科室信息
    Integer update_department(SecSecondDepartment secSecondDepartment);
}
