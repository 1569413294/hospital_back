package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecConsultation;

import java.util.List;

public interface SecConsulMapper {
    //是医生获取所有未回答
    List<SecConsultation> unanswered_all();
    //是医生助理获取所有未回答
    List<SecConsultation> unanswered_all1();
}
