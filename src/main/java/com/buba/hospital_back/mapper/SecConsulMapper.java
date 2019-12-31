package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecConsultation;
import com.buba.hospital_back.bean.SecDoctor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SecConsulMapper {
    //是医生获取所有未回答
    List<SecConsultation> unanswered_all(String phone);
    //是医生助理获取所有未回答
    List<SecConsultation> unanswered_all1(String phone);
    //回答问题
    boolean answered_hd(@Param("id") Integer id,@Param("response") String response);
    //修改退款状态
    boolean updestatus(Integer id);
    //是医生助理获取所有已回答
    List<SecConsultation> answered_all(String phone);
    //是医生获取所有已回答
    List<SecConsultation> answered_all1(String phone);
    /*查询当前用户的职称*/
    SecDoctor find_assistant(String phone);
}
