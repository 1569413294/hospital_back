package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecPic;

import java.util.List;

public interface SecHomeFocusService {
    //分页查询所有首页焦点图
    List<SecPic> queryAllFocusPic(int page, int limit, Integer hospitalId);
    //查询首页焦点图总数
    int queryCountFocusPic(Integer hospitalId);
    //获取展示顺序
    int getSequence(Integer hospitalId);
    //上传首页焦点图
    int uploadHomeFocusPic(SecPic secPic);
    //删除首页焦点图
    int delHomeFocusPic(Integer id);
    //根据焦点图id查询
    SecPic getHomeFocusPicById(Integer id);
}
