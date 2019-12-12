package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecConsultation;

import java.util.List;

public interface SecConsulService {
    //获取所有未回答
    List<SecConsultation> unanswered_all();
}
