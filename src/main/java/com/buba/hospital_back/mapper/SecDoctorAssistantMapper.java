package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecDoctorAssistant;

public interface SecDoctorAssistantMapper {

    //添加助理信息
    Integer add_as(SecDoctorAssistant secDoctorAssistant);
    //删除医生下对应的助理
    Boolean delete_zhu(Integer id);
}
