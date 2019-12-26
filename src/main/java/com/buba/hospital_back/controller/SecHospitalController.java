package com.buba.hospital_back.controller;


import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.service.SecHospitalArticleInfoService;
import com.buba.hospital_back.service.SecHospitalArticleService;
import com.buba.hospital_back.service.SecHospitalService;
import com.buba.hospital_back.service.SecHospitalUserService;
import com.buba.hospital_back.utils.OSSUtil;
import com.buba.hospital_back.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("SecHospital")
public class SecHospitalController {

    @Autowired
    private SecHospitalService secHospitalService;
    @Autowired
    private SecHospitalArticleInfoService secHospitalArticleInfoService;
    @Autowired
    private SecHospitalArticleService secHospitalArticleService;
    @Autowired
    private SecHospitalUserService secHospitalUserService;
    /*
     * 功能描述: <br>
     * 查询指定医院下的二级科室
     * @Param: [hospitalId]
     * @Return: java.util.List<com.buba.hospital_back.bean.SecFirstDepartment>
     * @Author: Admin
     * @Date: 2019/12/14 0014 9:55
     */
    @RequestMapping("hospital_change")
    public List<SecSecondDepartment> hospital_change(Integer hospitalId) {
        if (hospitalId > 0) {
            return secHospitalService.hospital_change(hospitalId);
        }
        return null;
    }
    /*
     * 功能描述: <br>
     * 查询主页已选择医院下面的科室
     * @Param: [session]
     * @Return: java.util.List<com.buba.hospital_back.bean.SecSecondDepartment>
     * @Author: Admin
     * @Date: 2019/12/14 0014 11:14
     */
    @RequestMapping("now_hospital")
    public List<SecSecondDepartment> now_hospital(HttpSession session) {
        //获取当前选择的医院
        Integer hospitalId = (Integer) session.getAttribute("hospitalId");
        if (hospitalId > 0) {
            return secHospitalService.hospital_change(hospitalId);
        }
        return null;
    }
    @RequestMapping("/allhospital")
    @ResponseBody
    public List<SecHospital> allhospital(){
        List<SecHospital> hospitalList = secHospitalService.allHospital();
        for (SecHospital h:hospitalList
                ) {
            System.out.println("所属医院："+h);
        }
        if (hospitalList!=null){
            return hospitalList;
        }
        return null;
    }
   /* *   
      * 功能概述： //医院介绍<br>
      * <>
      * @Param: [imgFile, imgFileIndex, articleInfoValue, articleInfoIndex, secHospitalArticle, session]     
      * @Return: java.util.Map<java.lang.String,java.lang.Object>  
      * @Author: Administrator 
      * @Date: 2019/12/24 11:36
      */
    @RequestMapping("/addYiYuanJieShao")
    public Map<String,Object> addYiYuanJieShao(@RequestParam("imgFile") MultipartFile[] imgFile, String imgFileIndex,
                                 String articleInfoValue, String articleInfoIndex,SecHospitalArticle secHospitalArticle,
                                 HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Integer hos = (Integer) session.getAttribute("hospitalId");//获取医院的id
        if (hos != null) {//判断医院id是否为空
            secHospitalArticle.setHospitalId(hos);//设置自建表的医院id
            secHospitalService.updatehospitaljieshao(secHospitalArticle);
            int updatehospitaljieshao = secHospitalArticleService.uploadArticle(secHospitalArticle);//修改文章表
            if (updatehospitaljieshao != 0) {
                SecHospitalArticleInfo secHospitalArticleInfo = new SecHospitalArticleInfo();//创建医院信息介绍表
                if (articleInfoValue != null) {//判断参数（文本内容集）是否为空
                    String[] articleInfo = articleInfoValue.split(",");//文本内容分割（，）
                    for (int j = 0; j < articleInfo.length; j++) {//便利文本框内容
                        secHospitalArticleInfo.setArticleInfo(articleInfo[j]);//将分割的每一段文本内容设置到医院介绍信息表的属性中
                        secHospitalArticleInfo.setArticleId(secHospitalArticle.getId());//将修改医院表的返回的主键id 设置到医院信息表的属性中
                        if (articleInfoIndex != null) {//判断 文本内容序号是否为空
                            String[] infoIndex = articleInfoIndex.split(",");//分割文本内容序号（，）
                            secHospitalArticleInfo.setSequence(Integer.parseInt(infoIndex[j]));//将分割的文本内容序号设置在创建医院信息表的字段上（ 排序）
                        }

                        secHospitalArticle.setHospitalId(hos);//设置医院id
                        secHospitalArticle.setArticleTitle("医院介绍");//标题
                        secHospitalArticle.setArticleType(3);
                        int i = secHospitalArticleService.uploadArticle(secHospitalArticle);
                        if (i != 0) {

                        }
                        secHospitalArticleService.addArticleInfo(secHospitalArticleInfo);//添加的方法（医院信息介绍表）
                    }
                }
                for (int k = 0; k < imgFile.length; k++) {//便利图片
                    String uuid = UUIDUtils.getUUID();//uuid 加密
                    String fileName = hos + "_" + uuid + ".jpg";//拼接名称
                    try {
                        String uploadUrl = OSSUtil.uploadImageToOSS(fileName, imgFile[k].getInputStream());//图片服务器
                        SecPic secPic = new SecPic();//创建图片表
                        secPic.setType("hospital");//设置固定的图片类型
                        secPic.setObjId(secHospitalArticle.getId());//图片所属对象（修改的医院id）
                        secPic.setObjType("YYJS");//设置固定的图片所属对象类型
                        secPic.setPicName(fileName);//设置图片名称（拼接名称）
                        secPic.setPicSize(String.valueOf(imgFile[k].getSize()));//设置图片大小
                        secPic.setPicPath(uploadUrl);//设置图片上传路径
                        if (imgFileIndex != null) {//判断图片序号是否为空
                            String[] fileIndex = imgFileIndex.split(",");//分割字符串
                            secPic.setSequence(Integer.parseInt(fileIndex[k]));//设置图片表的排序字段（图片的序号）
                        }
                        secHospitalArticleService.uploadImgArticle(secPic);//修改图片表的方法
                    } catch (IOException e) {
                        map.put("status", false);
                        e.printStackTrace();
                    }
                }
                map.put("status", true);
            } else {
                map.put("status", false);
            }
        } else {
            map.put("status", false);
        }
        return map;
    }
    /* *
     * 功能概述：医院管理<br>
     * <>
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SelectYygl>
     * @Author: Administrator
     * @Date: 2019/12/13 16:15
     */
    @RequestMapping("/allYongHugunLi")
    @ResponseBody
    public  List<SelectYygl> allYongHugunLi(){
        List<SelectYygl> selectYygls = secHospitalService.allYongHugunLi();
        for (SelectYygl s: selectYygls
                ) {
            System.out.println("医院管理："+s);

        }
        if(selectYygls!=null){
            return selectYygls;
        }

        return  null;

    }
    /* *
     * 功能概述：添加医院<br>
     * <>
     * @Param: [session, selectYygl]
     * @Return: boolean
     * @Author: Administrator
     * @Date: 2019/12/17 15:44
     */
    @RequestMapping("/addYiYuanGuanLi")
    @ResponseBody
    public  boolean addYongHuGuanLi(HttpSession session, SelectYygl selectYygl){
        if(selectYygl!=null){

            int i = secHospitalService.addYiYuanGuanLi(selectYygl);
            if (i!=0){
                SecUser secUser = new SecUser();
                secUser.setHospitalId(selectYygl.getId());
                /*登录人的id (session中获取)*/
                secUser.setId(1);
                int i1 = secHospitalUserService.addSecHospitalRelation(secUser);
                if (i1!=0){
                    return true;
                }
            }
        }
        return false;
    }
    /**
     * 功能概述：医院全称校验<br>
     * <>
     * @Param: [hospitalName]
     * @Return: boolean
     * @Author: Administrator
     * @Date: 2019/12/17 18:54
     */
    @RequestMapping("/selecthospitalName")
    @ResponseBody
    public  boolean selecthospitalName(String hospitalName){
        String secHospital = secHospitalService.seleSecHospital(hospitalName);
        if (secHospital!=null){
            return true;
        }
        return false;
    }
    /* *
     * 功能概述：医院简称的校验<br>
     * <>
     * @Param: [hospitalName]
     * @Return: boolean
     * @Author: Administrator
     * @Date: 2019/12/17 20:29
     */
    @RequestMapping("/selecthospitalSort")
    @ResponseBody
    public  boolean selecthospitalSort(String hospitalSort){
        String secHospital = secHospitalService.seleSecHospital(hospitalSort);
        if (secHospital!=null){
            return true;
        }
        return false;
    }
    /* *
     * 功能概述：修改医院的全称和医院的简称<br>
     * <>
     * @Param:
     * @Return:
     * @Author: Administrator
     * @Date: 2019/12/18 19:42
     */
    @RequestMapping("/updateHospital")
    @ResponseBody
    public boolean updateHospital(SecHospital secHospital){
        System.out.println("修改医院："+secHospital);
        int i = secHospitalService.updateHospital(secHospital);
        if(i!=0){
            return true;
        }
        return false;
    }
}
