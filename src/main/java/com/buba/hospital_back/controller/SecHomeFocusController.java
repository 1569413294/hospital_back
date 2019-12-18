package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecHospitalArticle;
import com.buba.hospital_back.bean.SecHospitalArticleInfo;
import com.buba.hospital_back.bean.SecHospitalArticleVo;
import com.buba.hospital_back.bean.SecPic;
import com.buba.hospital_back.service.SecHomeFocusService;
import com.buba.hospital_back.utils.OSSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @ClassName SecHomeFocusController
 * @Description TODO
 * @Created by Administrator on 2019/12/16 15:57
 * @Version 1.0
 **/
@RestController
@RequestMapping("homeFocus")
public class SecHomeFocusController {

    @Autowired
    private SecHomeFocusService secHomeFocusService;



    //查看首页焦点图
    @RequestMapping("getHomeFocus")
    public Map<String, Object> getHomeFocus(
            @RequestParam(required=false,defaultValue="1") int page,
            @RequestParam(required=false,defaultValue="4") int limit,
            HttpSession session){
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");
        if(hospitalId!=null){
            List<SecPic> list = secHomeFocusService.queryAllFocusPic(page,limit,hospitalId);
            int count = secHomeFocusService.queryCountFocusPic(hospitalId);
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("code", 0);
            map.put("msg", "");
            map.put("count", count);
            map.put("data", list);
            return map;
        }
        return null;
    }
    //获取展示顺序
    @RequestMapping("getSequence")
    public Map<String, Object> getHomeFocus(HttpSession session){
        Map<String,Object> map = new HashMap<String, Object>();
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");
        if(hospitalId!=null){
            int count = secHomeFocusService.getSequence(hospitalId);
            map.put("status",true);
            map.put("sequence",count);
        }else{
            map.put("status",false);
        }
        return map;
    }
    //上传首页焦点图
    @RequestMapping("uploadHomeFocusPic")
    public Map<String,Object> uploadHomeFocusPic(@RequestParam("pic") MultipartFile pic,
                                                 SecPic secPic,HttpSession session){
        Map<String,Object> map=new HashMap<>();
        Integer hos = (Integer) session.getAttribute("hospitalId");
        if(hos!=null){
            secPic.setObjId(hos);
            if (pic!=null) {
                try {
                    String uploadUrl = OSSUtil.uploadImageToOSS(secPic.getPicName(),pic.getInputStream());
                    secPic.setType("focus");
                    secPic.setObjType("hospital");
                    secPic.setPicSize(String.valueOf(pic.getSize()));
                    secPic.setPicPath(uploadUrl);
                    int i =secHomeFocusService.uploadHomeFocusPic(secPic);
                    if(i>0){
                        map.put("status", true);
                    }else{
                        map.put("status", false);
                    }
                } catch (IOException e) {
                    map.put("status", false);
                    e.printStackTrace();
                }
            }else{
            map.put("status", false);
            }
        }else{
            map.put("status",false);
        }
        return map;
    }
    //删除首页焦点图
    @RequestMapping("delHomeFocusPic")
    public boolean delHomeFocusPic(Integer id){
        int i = secHomeFocusService.delHomeFocusPic(id);
        if(i>0){
            return true;
        }
        return  false;
    }
    //根据焦点图id查询
    @RequestMapping("getHomeFocusPicById")
    public SecPic getHomeFocusPicById(Integer id){
       SecPic secPic = secHomeFocusService.getHomeFocusPicById(id);
        if(secPic!=null){
            return secPic;
        }
        return  null;
    }
}
