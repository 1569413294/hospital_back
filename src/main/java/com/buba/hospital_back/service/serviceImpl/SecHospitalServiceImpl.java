package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.mapper.ReservationMapper;
import com.buba.hospital_back.mapper.SecHospitalMapper;
import com.buba.hospital_back.service.ReservationService;
import com.buba.hospital_back.service.SecHospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author FJ
 * @title: ReservationServiceImpl
 * @projectName hospital_back
 * @date 2019/12/1110:12
 */
@Service
public class SecHospitalServiceImpl implements SecHospitalService {


    @Autowired
    private SecHospitalMapper secHospitalMapper;

    /*
     * 功能描述: <br>
     * 选择指定医院下的二级科室
     * @Param: [hospitalId]
     * @Return: java.util.List<com.buba.hospital_back.bean.SecFirstDepartment>
     * @Author: Admin
     * @Date: 2019/12/14 0014 9:55
     */
    @Override
    public List<SecSecondDepartment> hospital_change(Integer hospitalId) {
        if(hospitalId>0){
            return secHospitalMapper.hospital_change(hospitalId);
        }
        return null;
    }
}
