package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecConsultation;
import com.buba.hospital_back.service.SecConsulService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Administrator
 * @create 2019-12-11 9:43
 * @desc
 **/
@Controller
@RequestMapping("/consul")
public class SecConsulController {
    @Resource
    private SecConsulService secConsulService;
    //获取所有未回答
    @RequestMapping("unanswered_all")
    @ResponseBody
    public List<SecConsultation> unanswered_all(){
        List<SecConsultation> List=secConsulService.unanswered_all();
        return List;
    }
    //查看待回答详情
    @RequestMapping("answered_xq")
    @ResponseBody
    public SecConsultation answered_xq(Integer id,Integer qf){
        List<SecConsultation> list=secConsulService.unanswered_all();
        SecConsultation s=null;
        if (list!=null){
            s=new SecConsultation();
            for (int i=0;i<list.size();i++){
                if (id==list.get(i).getId()){
                    s.setId(list.get(i).getId());
                    s.setOrderNum(list.get(i).getOrderNum());
                    s.setQuestionTitle(list.get(i).getQuestionTitle());
                    s.setSex(list.get(i).getSex());
                    s.setIllnessDescription(list.get(i).getIllnessDescription());
                    s.setPayMoney(list.get(i).getPayMoney());
                    s.setRefundStartTime(list.get(i).getRefundStartTime());
                }
            }
        }
        return s;
    }
}
