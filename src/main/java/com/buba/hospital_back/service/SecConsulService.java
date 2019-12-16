package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecConsultation;

import java.util.List;

public interface SecConsulService {
    //获取所有未回答
    List<SecConsultation> unanswered_all(String phone);
    //回答问题
    boolean answered_hd(Integer id, String response);
    //修改退款状态
    boolean updestatus(Integer id);
    //获取所有已回答
    List<SecConsultation> answered_all(String phone);
}
