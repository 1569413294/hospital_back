package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.mapper.SecHospitalArticleMapper;
import com.buba.hospital_back.service.SecHospitalArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName SecHospitalArticleServiceImpl
 * @Description TODO
 * @Created by Administrator on 2019/12/13 14:51
 * @Version 1.0
 **/
@Service
public class SecHospitalArticleServiceImpl implements SecHospitalArticleService {

    @Resource
    private SecHospitalArticleMapper secHospitalArticleMapper;

    //根据关键字获取医院所属的所有文章并进行分页
    @Override
    public List<SecHospitalArticleVo> queryAllData(int page, int limit, String keyWord, Integer hospitalId) {
        return secHospitalArticleMapper.queryAllData(page,limit,keyWord,hospitalId);
    }
    //获取总条数
    @Override
    public int queryAllCount(Integer hospitalId, String keyWord) {
        return secHospitalArticleMapper.queryAllCount(hospitalId,keyWord);
    }
    //删除医院文章
    @Override
    public int delHospitalArticle(Integer id) {
        return secHospitalArticleMapper.delHospitalArticle(id);
    }
    //查询文章栏目
    @Override
    public List<SecHospitalArticleType> selectHospitalArticleType() {
        return secHospitalArticleMapper.selectHospitalArticleType();
    }
    //添加文章
    @Override
    public int uploadArticle(SecHospitalArticle secHospitalArticle) {
        return secHospitalArticleMapper.uploadArticle(secHospitalArticle);
    }
    //添加文字具体内容
    @Override
    public void addArticleInfo(SecHospitalArticleInfo secHospitalArticleInfo) {
        secHospitalArticleMapper.addArticleInfo(secHospitalArticleInfo);
    }
    //添加文章图片
    @Override
    public void uploadImgArticle(SecPic secPic) {
        secHospitalArticleMapper.uploadImgArticle(secPic);
    }
    //根据文章id查询
    @Override
    public SecHospitalArticle getHospitalArticleById(Integer id) {
        return secHospitalArticleMapper.getHospitalArticleById(id);
    }
    //根据文章id查询文章内容
    @Override
    public List<SecHospitalArticleInfo> getHospitalArticleInfo(Integer id) {
        return secHospitalArticleMapper.getHospitalArticleInfo(id);
    }
    //根据文章id查询文章照片
    @Override
    public List<SecPic> getHospitalArticlePic(Integer id) {
        return secHospitalArticleMapper.getHospitalArticlePic(id);
    }
}
