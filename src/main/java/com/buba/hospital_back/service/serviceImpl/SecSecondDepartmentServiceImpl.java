package com.buba.hospital_back.service.serviceImpl;


import com.buba.hospital_back.bean.SecSecondDepartment;
import com.buba.hospital_back.mapper.SecSecondDepartmentMapper;
import com.buba.hospital_back.service.SecSecondDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecSecondDepartmentServiceImpl  implements SecSecondDepartmentService {

    @Autowired
    private SecSecondDepartmentMapper secSecondDepartmentMapper;


    /*
     * 功能描述: <br>
     * 修改二级科室信息
     * @Param: [secSecondDepartment]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/11 0011 18:43
     */
    @Override
    public Integer update_department(SecSecondDepartment secSecondDepartment) {
        //修改
        Integer integer = secSecondDepartmentMapper.update_department(secSecondDepartment);
        //如果修改成功 返回一级科室id
        if(integer>0){
            return secSecondDepartment.getFirstDepartmentId();
        }
        return 0;
    }
}
