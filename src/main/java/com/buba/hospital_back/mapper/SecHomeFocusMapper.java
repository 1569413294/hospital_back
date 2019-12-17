package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecPic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SecHomeFocusMapper {
    //分页查询所有首页焦点图
    List<SecPic> queryAllFocusPic(@Param("page") int page, @Param("limit")int limit, @Param("hospitalId")Integer hospitalId);
    //查询首页焦点图总数
    int queryCountFocusPic(Integer hospitalId);
    //获取展示顺序
    int getSequence(Integer hospitalId);
    //上传首页焦点图
    int uploadHomeFocusPic(SecPic secPic);
    //删除首页焦点图
    int delHomeFocusPic(Integer id);
}
