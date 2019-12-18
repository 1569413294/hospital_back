package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.service.SecHospitalArticleService;
import com.buba.hospital_back.utils.JSONUtils;
import com.buba.hospital_back.utils.OSSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * @ClassName ArticleController
 * @Description TODO
 * @Created by Administrator on 2019/12/13 10:59
 * @Version 1.0
 **/

@RestController
@RequestMapping("/hospitalArticle")
public class SecHospitalArticleController {

    @Autowired
    private SecHospitalArticleService secHospitalArticleService;
    //查看医院所属文章
    @RequestMapping("getHospitalArticle")
    public Map<String, Object> getHospitalArticle(
            @RequestParam(required=false,defaultValue="1") int page,
            @RequestParam(required=false,defaultValue="15") int limit,
            String keyWord,
            HttpSession session){
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");
        if(hospitalId!=null){
            List<SecHospitalArticleVo> list = secHospitalArticleService.queryAllData(page,limit,keyWord,hospitalId);
            int count = secHospitalArticleService.queryAllCount(hospitalId,keyWord);
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("code", 0);
            result.put("msg", "");
            result.put("count", count);
            result.put("data", list);
            return result;
        }
        return null;
    }
    //删除医院文章
    @RequestMapping("delHospitalArticle")
    public boolean delHospitalArticle(Integer id){
        int i = secHospitalArticleService.delHospitalArticle(id);
        if(i>0){
           return true;
        }
        return  false;
    }

    //查询文章栏目
    @RequestMapping("selectHospitalArticleType")
    public List<SecHospitalArticleType> selectHospitalArticleType(){
        List<SecHospitalArticleType> list = secHospitalArticleService.selectHospitalArticleType();
        if(list!=null)
        {
            return list;
        }
        return null;
    }
    //上传文章
    @RequestMapping("uploadArticle")
    public Map<String,Object> uploadArticle(@RequestParam("imgFile") MultipartFile[] imgFile, String imgFileIndex,
                                         String articleInfoValue, String articleInfoIndex,SecHospitalArticle secHospitalArticle,
                                         HttpSession session){
        Map<String,Object> map=new HashMap<>();
        Integer hos = (Integer) session.getAttribute("hospitalId");
        if(hos!=null){
            secHospitalArticle.setHospitalId(hos);
            //添加文章
            int i = secHospitalArticleService.uploadArticle(secHospitalArticle);
            if(i>0) {
                SecHospitalArticleInfo secHospitalArticleInfo = new SecHospitalArticleInfo();
                if (articleInfoValue != null) {
                    String[] articleInfo = articleInfoValue.split(",");
                    for (int j=0;j<articleInfo.length;j++) {
                        secHospitalArticleInfo.setArticleInfo(articleInfo[j]);
                        secHospitalArticleInfo.setArticleId(secHospitalArticle.getId());
                       if(articleInfoIndex!=null){
                           String[] infoIndex = articleInfoIndex.split(",");
                           secHospitalArticleInfo.setSequence(Integer.parseInt(infoIndex[j]));
                       }
                        secHospitalArticleService.addArticleInfo(secHospitalArticleInfo);
                    }
                }


                for (int k=0;k<imgFile.length;k++) {
                    UUID uuid = UUID.randomUUID();
                    String fileName =  hos + "_" + uuid+".jpg";
                    try {
                        String uploadUrl = OSSUtil.uploadImageToOSS(fileName,imgFile[k].getInputStream());
                        SecPic secPic = new SecPic();
                        secPic.setType("hospital");
                        secPic.setObjId(secHospitalArticle.getId());
                        secPic.setObjType("article");
                        secPic.setPicName(fileName);
                        secPic.setPicSize(String.valueOf(imgFile[k].getSize()));
                        secPic.setPicPath(uploadUrl);
                        if(imgFileIndex!=null){
                            String[] fileIndex=imgFileIndex.split(",");
                            secPic.setSequence(Integer.parseInt(fileIndex[k]));
                        }
                        secHospitalArticleService.uploadImgArticle(secPic);
                    } catch (IOException e) {
                        map.put("status", false);
                        e.printStackTrace();
                    }
                }
                map.put("status", true);
            }else{
                map.put("status", false);
            }
        }else{
            map.put("status",false);
        }
        return map;
    }

    //根据文章id查询
    @RequestMapping("getHospitalArticleById")
    public SecHospitalArticle getHospitalArticleById(Integer id){
        SecHospitalArticle secHospitalArticle = secHospitalArticleService.getHospitalArticleById(id);
        if(secHospitalArticle!=null){
            return secHospitalArticle;
        }
        return  null;
    }
    //根据文章id查询文章内容
    @RequestMapping("getHospitalArticleInfo")
    public Map<String,Object> getHospitalArticleInfo(Integer id){
        Map<String,Object> map = new HashMap<>();
        List<SecHospitalArticleInfo> list = secHospitalArticleService.getHospitalArticleInfo(id);
        if(id!=null){
            map.put("status",true);
            if(list!=null){
                map.put("articleInfo",list);
            }
            List<SecPic> list2 = secHospitalArticleService.getHospitalArticlePic(id);
            if(list2!=null){
                map.put("articlePic",list2);
            }
        }else{
            map.put("status",false);
        }

        return  map;
    }


}
