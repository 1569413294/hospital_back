package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.*;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface SecHospitalArticleMapper {
    //根据关键字获取医院所属的所有文章并进行分页
    List<SecHospitalArticleVo> queryAllData(@Param("page")int page, @Param("limit")int limit, @Param("keyWord")String keyWord, @Param("hospitalId")Integer hospitalId);
    //获取总条数
    int queryAllCount(@Param("hospitalId")Integer hospitalId,@Param("keyWord")String keyWord);
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
