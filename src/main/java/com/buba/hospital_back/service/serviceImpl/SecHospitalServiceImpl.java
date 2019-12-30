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

    @Override
    public List<SecHospital> allHospital() {
        return secHospitalMapper.allHospital();
    }
    /* *
     * 功能概述：医院介绍<br>
     * <>
     * @Param: [secHospital]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/22 20:03
     */
    @Override
    public int updatehospitaljieshao(SecHospitalArticle secHospitalArticle) {
        return secHospitalMapper.updatehospitaljieshao(secHospitalArticle);
    }
    /* *   
       * 功能概述：后台管理医院管理<br>
       * <>
       * @Param: []     
       * @Return: java.util.List<com.buba.hospital_back.bean.SelectYygl>  
       * @Author: Administrator 
       * @Date: 2019/12/24 14:40
       */
    @Override
    public List<SelectYygl> allYongHugunLi() {
        return secHospitalMapper.allYongHugunLi();
    }
    /* *
     * 功能概述：添加医院<br>
     * <>
     * @Param: [selectYygl]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/14 14:09
     */
    @Override
    public int addYiYuanGuanLi(SelectYygl selectYygl) {
        return secHospitalMapper.addYiYuanGuanLi(selectYygl);
    }
    /* *
     * 功能概述：医院全称校验<br>
     * <>
     * @Param: [hospitalName]
     * @Return: com.buba.hospital_back.bean.SecHospital
     * @Author: Administrator
     * @Date: 2019/12/17 19:00
     */
    @Override
    public String seleSecHospital(String hospitalName) {
        return secHospitalMapper.seleSecHospital(hospitalName);
    }
    /* *
     * 功能概述：医院简称校验<br>
     * <>
     * @Param: [hospitalSort]
     * @Return: java.lang.String
     * @Author: Administrator
     * @Date: 2019/12/17 20:40
     */
    @Override
    public String selecthospitalSort(String hospitalSort) {
        return secHospitalMapper.selecthospitalSort(hospitalSort);
    }

    /* *
     * 功能概述：修改医院全称和简称<br>
     * <>
     * @Param: [hospitalName, hospitalSort]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 19:32
     */
    @Override
    public int updateHospital(SecHospital secHospital) {
        return secHospitalMapper.updateHospital(secHospital);
    }
    /* *
     * 功能概述：医院介绍 ---获取首页医院<br>
     * <>
     * @Param: [hospitalId]
     * @Return: java.lang.String
     * @Author: Administrator
     * @Date: 2019/12/30 9:24
     */
    @Override
    public String gitHospitalName(Integer hospitalId) {
        return secHospitalMapper.gitHospitalName(hospitalId);
    }
}
