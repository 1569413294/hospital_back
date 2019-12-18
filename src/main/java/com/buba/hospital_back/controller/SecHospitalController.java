package com.buba.hospital_back.controller;


import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecHospital;
import com.buba.hospital_back.bean.SecSecondDepartment;
import com.buba.hospital_back.service.SecHospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@RequestMapping("SecHospital")
public class SecHospitalController {

    @Autowired
    private SecHospitalService secHospitalService;

    /*
     * 功能描述: <br>
     * 查询指定医院下的二级科室
     * @Param: [hospitalId]
     * @Return: java.util.List<com.buba.hospital_back.bean.SecFirstDepartment>
     * @Author: Admin
     * @Date: 2019/12/14 0014 9:55
     */
    @RequestMapping("hospital_change")
    public List<SecSecondDepartment> hospital_change(Integer hospitalId) {
        if (hospitalId > 0) {
            return secHospitalService.hospital_change(hospitalId);
        }
        return null;
    }
    /*
     * 功能描述: <br>
     * 查询主页已选择医院下面的科室
     * @Param: [session]
     * @Return: java.util.List<com.buba.hospital_back.bean.SecSecondDepartment>
     * @Author: Admin
     * @Date: 2019/12/14 0014 11:14
     */
    @RequestMapping("now_hospital")
    public List<SecSecondDepartment> now_hospital(HttpSession session) {
        //获取当前选择的医院
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");
        if (hospitalId > 0) {
            return secHospitalService.hospital_change(hospitalId);
        }
        return null;
    }
}
