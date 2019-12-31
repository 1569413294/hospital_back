package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecConsultation;
import com.buba.hospital_back.bean.SecPic;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.service.SecConsulService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
    public List<SecConsultation> unanswered_all(HttpSession session){
        SecUser user = (SecUser) session.getAttribute("user");
        if (user!=null){
            String phone = user.getPhone();
            List<SecConsultation> List=secConsulService.unanswered_all(phone,user.getRoleId());
            return List;
        }else {
            return null;
        }
    }
    //查看待回答详情
    @RequestMapping("answered_xq")
    @ResponseBody
    public SecConsultation answered_xq(Integer id,Integer qf,HttpSession session){
        SecUser user = (SecUser) session.getAttribute("user");
        if (user!=null){
            String phone = user.getPhone();
            List<SecConsultation> list=secConsulService.unanswered_all(phone,user.getRoleId());
            SecConsultation s=null;
            if (list!=null){
                s=new SecConsultation();
                for (int i=0;i<list.size();i++){
                    if (qf==1&&id==list.get(i).getId()){
                        //图片查询
                        List<SecPic> secPics=secConsulService.answered_allpic(list.get(i).getOrderId());
                        if (secPics.size()>0){
                            s.setSecPic(secPics);
                        }
                            s.setId(list.get(i).getId());
                            s.setOrderNum(list.get(i).getOrderNum());
                            s.setQuestionTitle(list.get(i).getQuestionTitle());
                            s.setSex(list.get(i).getSex());
                            s.setIllnessDescription(list.get(i).getIllnessDescription());
                            s.setPayMoney(list.get(i).getPayMoney());
                            s.setRefundStartTime(list.get(i).getRefundStartTime());
                        return s;
                    }else if(qf==2&&id<list.get(i).getId()&&list.get(i).getStatus().equals("1")&&list.get(i).getStatus1().equals("1")) {
                        //图片查询
                        List<SecPic> secPics=secConsulService.answered_allpic(list.get(i).getOrderId());
                        if (secPics.size()>0){
                            s.setSecPic(secPics);
                        }
                        s.setOrderNum(list.get(i).getOrderNum());
                        s.setId(list.get(i).getId());
                        s.setQuestionTitle(list.get(i).getQuestionTitle());
                        s.setSex(list.get(i).getSex());
                        s.setIllnessDescription(list.get(i).getIllnessDescription());
                        s.setPayMoney(list.get(i).getPayMoney());
                        s.setRefundStartTime(list.get(i).getRefundStartTime());
                        return s;
                    }else if(qf==3&&id<list.get(i).getId()&&list.get(i).getStatus().equals("1")&&list.get(i).getStatus1().equals("5")) {
                        //图片查询
                        List<SecPic> secPics=secConsulService.answered_allpic(list.get(i).getOrderId());
                        if (secPics.size()>0){
                            s.setSecPic(secPics);
                        }
                        s.setOrderNum(list.get(i).getOrderNum());
                        s.setQuestionTitle(list.get(i).getQuestionTitle());
                        s.setId(list.get(i).getId());
                        s.setSex(list.get(i).getSex());
                        s.setIllnessDescription(list.get(i).getIllnessDescription());
                        s.setPayMoney(list.get(i).getPayMoney());
                        s.setRefundStartTime(list.get(i).getRefundStartTime());
                        return s;
                    }
                }
            }
            return s;
        }else {
            return null;
        }
    }

    //回答问题
    @RequestMapping("answered_hd")
    @ResponseBody
    public boolean answered_hd(Integer id,String response){
        boolean b=secConsulService.answered_hd(id,response);
        return b;
    }
    //修改退款状态
    @RequestMapping("updestatus")
    @ResponseBody
    public boolean  updestatus(Integer id){
       boolean b=secConsulService.updestatus(id);
        return b;
    }


    //获取所有已回答
    @RequestMapping("answered_all")
    @ResponseBody
    public List<SecConsultation> answered_all(HttpSession session){
        SecUser user = (SecUser) session.getAttribute("user");
        if (user!=null){
            String phone = user.getPhone();
            List<SecConsultation> List=secConsulService.answered_all(phone, user.getRoleId());
            return List;
        }else {
            return null;
        }


    }

    //查看已回答详情
    @RequestMapping("yi_answered_xq")
    @ResponseBody
    public SecConsultation yi_answered_xq(Integer id,Integer qf,HttpSession session){
        SecUser user = (SecUser) session.getAttribute("user");
        if (user!=null){
            String phone = user.getPhone();
            List<SecConsultation> list=secConsulService.answered_all(phone,user.getRoleId());
            SecConsultation s=null;
            if (list!=null){
                s=new SecConsultation();
                for (int i=0;i<list.size();i++){
                    if (qf==1&&id==list.get(i).getId()){
                        //图片查询
                        List<SecPic> secPics=secConsulService.answered_allpic(list.get(i).getOrderId());
                        if (secPics.size()>0){
                            s.setSecPic(secPics);
                        }
                        s.setId(list.get(i).getId());
                        s.setOrderNum(list.get(i).getOrderNum());
                        s.setQuestionTitle(list.get(i).getQuestionTitle());
                        s.setSex(list.get(i).getSex());
                        s.setIllnessDescription(list.get(i).getIllnessDescription());
                        s.setPayWay(list.get(i).getPayWay());
                        s.setName1(list.get(i).getName1());
                        s.setName(list.get(i).getName());
                        s.setResponse(list.get(i).getResponse());
                        return s;
                    }else if(qf==2&&id<list.get(i).getId()&&list.get(i).getStatus().equals("0")) {
                        //图片查询
                        List<SecPic> secPics=secConsulService.answered_allpic(list.get(i).getOrderId());
                        if (secPics.size()>0){
                            s.setSecPic(secPics);
                        }
                        s.setOrderNum(list.get(i).getOrderNum());
                        s.setId(list.get(i).getId());
                        s.setQuestionTitle(list.get(i).getQuestionTitle());
                        s.setSex(list.get(i).getSex());
                        s.setIllnessDescription(list.get(i).getIllnessDescription());
                        s.setPayMoney(list.get(i).getPayMoney());
                        s.setPayWay(list.get(i).getPayWay());
                        s.setName1(list.get(i).getName1());
                        s.setName(list.get(i).getName());
                        s.setResponse(list.get(i).getResponse());
                        return s;
                    }
                }
            }
            return s;
        }else {
            return null;
        }

    }
}
