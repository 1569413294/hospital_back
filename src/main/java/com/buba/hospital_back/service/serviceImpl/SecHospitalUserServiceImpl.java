package com.buba.hospital_back.service.serviceImpl;


import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.bean.SelectUrhdm;
import com.buba.hospital_back.mapper.SecHospitalUserMapper;
import com.buba.hospital_back.service.SecHospitalUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecHospitalUserServiceImpl implements SecHospitalUserService {
@Autowired
    private SecHospitalUserMapper secHospitalUserMapper;

    /* *
     * 功能概述：添加用户  关联表<br>
     * <>
     * @Param: [secUser]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/12 15:29
     */
    @Override
    public int addSecHospitalRelation(SecUser secUser) {
        return secHospitalUserMapper.addSecHospitalRelation(secUser);
    }
    /* *
     * 功能概述：<br>
     * <>
     * @Param: [hospitalId, adminId, hospitalIds]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/13 11:20
     */
    @Override
    public int updateSecHospitalRelation(SelectUrhdm selectUrhdm) {
        return secHospitalUserMapper.updateSecHospitalRelation(selectUrhdm);
    }

/* *   
   * 功能概述：用户管理--添加医院---user-hospital<br>
   * <>
   * @Param: [addDoctor]     
   * @Return: int  
   * @Author: Administrator 
   * @Date: 2019/12/18 15:02
   */
    @Override
    public int addDoctor(AddDoctor addDoctor) {
        return secHospitalUserMapper.addDoctor(addDoctor);
    }
}

