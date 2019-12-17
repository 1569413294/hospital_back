package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.*;

import java.util.List;

public interface SecHospitalArticleService {
    //根据关键字获取医院所属的所有文章并进行分页
    List<SecHospitalArticleVo> queryAllData(int page, int limit, String keyWord, Integer hospitalId);
    //获取总条数
    int queryAllCount(Integer hospitalId, String keyWord);
    //删除医院文章
    int delHospitalArticle(Integer id);
    //查询文章栏目
    List<SecHospitalArticleType> selectHospitalArticleType();
    //添加文章
    int uploadArticle(SecHospitalArticle secHospitalArticle);
    //添加文字具体内容
    void addArticleInfo(SecHospitalArticleInfo secHospitalArticleInfo);
    //添加文章图片
    void uploadImgArticle(SecPic secPic);
}
