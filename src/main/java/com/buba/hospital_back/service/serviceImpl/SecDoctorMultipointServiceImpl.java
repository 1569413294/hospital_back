package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecDoctorMultipoint;
import com.buba.hospital_back.mapper.SecDoctorMapper;
import com.buba.hospital_back.mapper.SecDoctorMultipointMapper;
import com.buba.hospital_back.service.SecDoctorMultipointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecDoctorMultipointServiceImpl implements SecDoctorMultipointService {
@Autowired
    private SecDoctorMultipointMapper secDoctorMultipointMapper;

/* *   
   * 功能概述：添加医生 与医院的关联 <br>
   * <>
   * @Param: [secDoctorMultipoint]     
   * @Return: int  
   * @Author: Administrator 
   * @Date: 2019/12/18 11:47
   */
    @Override
    public int addSecDoctorMultipointMapper(AddDoctor addDoctor) {
        return secDoctorMultipointMapper.addSecDoctorMultipointMapper(addDoctor);
    }

}
