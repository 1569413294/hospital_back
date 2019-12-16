package com.buba.hospital_back.controller;


import com.buba.hospital_back.bean.DoctorVo;
import com.buba.hospital_back.bean.SecDoctor;
import com.buba.hospital_back.bean.SecHospital;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.service.SecDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("SecDoctor")
public class SecDoctorController {


    @Autowired
    private SecDoctorService secDoctorService;


    /*
     * 功能描述: <br>
     * 所有医生信息
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.DoctorVo>
     * @Author: Admin
     * @Date: 2019/12/12 0012 15:34
     */
    @RequestMapping("doctor_all")
    public List<DoctorVo> doctor_all(){
        return secDoctorService.doctor_all();
    }
    /*
     * 功能描述: <br>
     * 查询本医院下的医生
     * @Param: [session]
     * @Return: java.util.List<com.buba.hospital_back.bean.DoctorVo>
     * @Author: Admin
     * @Date: 2019/12/14 0014 16:53
     */
    @RequestMapping("doctor_al")
    public List<DoctorVo> doctor_al(HttpSession session){
        Integer hospitalId =(Integer) session.getAttribute("hospitalId");
        if(hospitalId>0){
            return secDoctorService.doctor_al(hospitalId);
        }
      return null;
    }
    /*
     * 功能描述: <br>
     * 获取所有医院 排除当前医院
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecHospital>
     * @Author: Admin
     * @Date: 2019/12/13 0013 11:10
     */
    @RequestMapping("hospital_all")
    public List<SecHospital> hospital_all(HttpSession session){
        //获取当前医院id
        Integer hospitalId =(Integer) session.getAttribute("hospitalId");
        if(hospitalId>0){
            return secDoctorService.hospital_all(hospitalId);
        }
        return null;
    }

    /*
     * 功能描述: <br>
     * 添加医生信息
     * @Param: [hos_de, zhucc, secDoctor, session, file]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/16 0016 14:28
     */
    @RequestMapping("add_doctor")
    public Boolean add_doctor(String[] hos_de, Integer[] zhucc, SecDoctor secDoctor, HttpSession session, MultipartFile file){
        //获取当前医院id
        SecUser secUser = (SecUser) session.getAttribute("user");
        //如果session未过期 并不为空
        if(secUser!=null  && secDoctor!=null){
            //修改创建人信息
            secDoctor.setCreator(secUser.getId());
            //添加医生信息
            return secDoctorService.add_doctor(hos_de,zhucc,secDoctor,file);
        }
        return null;
    }


}
