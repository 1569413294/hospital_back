package com.buba.hospital_back.controller;


import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.service.SecDoctorMultipointService;
import com.buba.hospital_back.service.SecDoctorService;
import com.buba.hospital_back.service.SecHospitalUserService;
import com.buba.hospital_back.service.SecUserService;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    @Autowired
    private SecUserService secUserService;
    @Autowired
    private SecDoctorMultipointService secDoctorMultipointService;
    @Autowired
    private SecHospitalUserService secHospitalUserService;
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
    public Boolean add_doctor(Integer pid,String[] hos_de, String[] zhucc, SecDoctor secDoctor, HttpSession session, MultipartFile file){
        //获取当前用户id
        SecUser secUser = (SecUser) session.getAttribute("user");
        //获取医院id
        Integer ho_id = (Integer) session.getAttribute("hospitalId");
        //如果session未过期 并不为空
        if(secUser!=null  && secDoctor!=null && ho_id!=null){
            //修改创建人信息
            secDoctor.setCreator(secUser.getId());
            //添加医生信息
            return secDoctorService.add_doctor(pid,hos_de,zhucc,secDoctor,file);
        }
        return null;
    }
    /*
     * 功能描述: <br>
     * 修改医生前 回显数据
     * @Param: [id]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/16 0016 14:36
     */
    @RequestMapping("doctor_xq")
    public   DoctorVo2 doctor_xq(Integer id){
        if(id>0){
         return  secDoctorService.doctor_xq(id);
        }

        return null;
    }


    /*
     * 功能描述: <br>
     * 删除医生对应的医院以及科室信息
     * @Param: [id]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/17 0017 13:34
     */
    @RequestMapping("delete_h_d")
    public Boolean delete_h_d(Integer id){
        return secDoctorService.delete_h_d(id);
    }
    /*
     * 功能描述: <br>
     * 删除助理
     * @Param: [id]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/17 0017 14:06
     */
    @RequestMapping("delete_zhu")
    public Boolean delete_zhu(Integer id){
        return secDoctorService.delete_zhu(id);
    }
/* *   
   * 功能概述：<br>
   * <>
   * @Param: 后台管理---用户管理-->添加用户（角色==医生）[addDoctor]     
   * @Return: boolean  
   * @Author: Administrator 
   * @Date: 2019/12/23 19:58
   */
    @Transactional
    @RequestMapping("/addDoctors")
    @ResponseBody
    public boolean addDoctors(AddDoctor addDoctor) {

        int i = secDoctorService.addDoctors(addDoctor);
        System.out.println("添加医生表："+addDoctor);
        if (i!=0){
            int i2 = secDoctorMultipointService.addSecDoctorMultipointMapper(addDoctor);
            System.out.println("添加医生医院关联表："+addDoctor);
            if (i2!=0){
                int i1 = secUserService.addDoctor(addDoctor);
                System.out.println("添加用户表："+addDoctor+"状态码："+i1);
                if (i1!=0){
                    int i3 = secHospitalUserService.addDoctor(addDoctor);
                    System.out.println("添加用户医院表："+addDoctor+"状态码："+i3);
                    if (i3!=0){
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
