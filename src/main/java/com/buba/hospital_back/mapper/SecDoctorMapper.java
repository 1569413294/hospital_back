package com.buba.hospital_back.mapper;


import com.buba.hospital_back.bean.DoctorVo;
import com.buba.hospital_back.bean.DoctorVo2;
import com.buba.hospital_back.bean.SecDoctor;
import com.buba.hospital_back.bean.SecHospital;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SecDoctorMapper {
    //查询所有医生信息
    List<DoctorVo> doctor_all();
    //查询所有医院信息
    List<SecHospital> hospital_all(Integer hospitalId);
    //查询指定医院下对应的医生
    @Select("select id,name from sec_doctor where id = #{hospitalId}")
    List<DoctorVo> doctor_al(Integer hospitalId);
    //添加医生信息
    Integer add_doctor(SecDoctor secDoctor);
    //查询医生回显数据
    DoctorVo2 doctor_xq(Integer id);
}
