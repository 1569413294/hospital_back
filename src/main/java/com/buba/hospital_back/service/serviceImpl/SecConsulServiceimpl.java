package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecConsultation;
import com.buba.hospital_back.mapper.SecConsulMapper;
import com.buba.hospital_back.service.SecConsulService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 * @create 2019-12-11 9:45
 * @desc impl
 **/
@Service
public class SecConsulServiceimpl implements SecConsulService {
    @Resource
    private SecConsulMapper secConsulMapper;

    //获取所有未回答
    @Override
    public List<SecConsultation> unanswered_all() {
        Integer assistant=1;
        List<SecConsultation> list=new ArrayList<>();
        if (assistant==0){
            //是医生助理获取所有未回答
            list=secConsulMapper.unanswered_all1();
        }else if (assistant==1){
            //是医生获取所有未回答
            list=secConsulMapper.unanswered_all();
        }
        return list;
    }
}
