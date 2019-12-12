package com.buba.hospital_back.controller;


import com.buba.hospital_back.bean.DepartmentVo;
import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;
import com.buba.hospital_back.service.SecFirstDepartmentService;
import com.buba.hospital_back.service.SecSecondDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("SecFirstDepartment")
public class SecFirstDepartmentControoler {


    @Autowired
    private SecFirstDepartmentService secFirstDepartmentService;

    @Autowired
    private SecSecondDepartmentService secSecondDepartmentService;


    /*
     * 功能描述: <br>
     * 查询所有科室信息,以及对应医院的医生数量
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecFirstDepartment>
     * @Author: Admin
     * @Date: 2019/12/11 0011 9:23
     */
    @RequestMapping("office_all")
    public List<DepartmentVo> office_all(){
        return  secFirstDepartmentService.office_all();
    }

    /*
     * 功能描述: <br>
     * 添加一级科室以及二级科室信息
     * @Param: [sta, secFirstDepartment, secSecondDepartment]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/11 0011 18:42
     */
    @RequestMapping("add_office")
    public Integer add_office(Integer sta,SecFirstDepartment secFirstDepartment, SecSecondDepartment secSecondDepartment){
        //如果id==2为修改状态  说明是修改二级科室操作
        if(sta==2){
            //修改二级科室信息
            return secSecondDepartmentService.update_department(secSecondDepartment);
        }
        //等于3代表继续添加二级科室  在一科室的基础上继续添加
        if(sta==3){
            return   secFirstDepartmentService.add_office_two(secSecondDepartment);
        }
        //等于3代表继续添加二级菜单
        return secFirstDepartmentService.add_office(secFirstDepartment,secSecondDepartment);
    }

    /*
     * 功能描述: <br>
     * 判断一级科室是否已存在
     * @Param: [departmentName]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/11 0011 19:04
     */
    @RequestMapping("is_have_departmentName")
    public Integer is_have_departmentName(String departmentName){
        return secFirstDepartmentService.is_have_departmentName(departmentName);
    }
    /*
     * 功能描述: <br>
     * 判断二级科室信息是否存在
     * @Param: [secondDepartmentName]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/12 0012 9:00
     */
    @RequestMapping("is_have_secondDepartmentName")
    public Integer is_have_secondDepartmentName(String secondDepartmentName){
        return secFirstDepartmentService.is_have_secondDepartmentName(secondDepartmentName);
    }

}
