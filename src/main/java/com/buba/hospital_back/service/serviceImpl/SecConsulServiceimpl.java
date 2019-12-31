package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecConsultation;
import com.buba.hospital_back.bean.SecDoctor;
import com.buba.hospital_back.bean.SecPic;
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
    public List<SecConsultation> unanswered_all(String phone,Integer roleId) {
        List<SecConsultation> list = new ArrayList<>();
        if (roleId==3){
            /*查询当前用户的职称*/
            SecDoctor secDoctor=secConsulMapper.find_assistant(phone);
            if (secDoctor!=null) {
                if (secDoctor.getAssistant()==false) {
                    //是医生助理获取所有未回答
                    list = secConsulMapper.unanswered_all1(phone);
                } else if (secDoctor.getAssistant()==true) {
                    //是医生获取所有未回答
                    list = secConsulMapper.unanswered_all(phone);
                }
                return list;
            }else {
                return null;
            }
        }else if (roleId==1||roleId==2){
            //是管理员获取所有未回答
            list = secConsulMapper.unanswered_all2();
            return list;
        }else {
            return null;
        }

    }
    //回答问题
    @Override
    public boolean answered_hd(Integer id, String response) {
        return secConsulMapper.answered_hd(id,response);
    }
    //修改退款状态
    @Override
    public boolean updestatus(Integer id) {
        return secConsulMapper.updestatus(id);
    }

    @Override
    public List<SecConsultation> answered_all(String phone, Integer roleId) {
        List<SecConsultation> list = new ArrayList<>();
        if (roleId==3) {
            /*查询当前用户的职称*/
            SecDoctor secDoctor = secConsulMapper.find_assistant(phone);
            if (secDoctor != null) {
                if (secDoctor.getAssistant() == false) {
                    //是医生助理获取所有已回答
                    list = secConsulMapper.answered_all(phone);
                } else if (secDoctor.getAssistant() == true) {
                    //是医生获取所有已回答
                    list = secConsulMapper.answered_all1(phone);
                }
                return list;
            } else {
                return null;
            }
        }else if (roleId==1||roleId==2){
            //是管理员获取所有回答
            list = secConsulMapper.answered_all2();
            return list;
        }else {
            return null;
        }

    }
    //图片查询
    @Override
    public List<SecPic> answered_allpic(Integer id) {
        return secConsulMapper.answered_allpic(id);
    }
}
