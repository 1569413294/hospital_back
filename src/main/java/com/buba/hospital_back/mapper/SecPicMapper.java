package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecPic;

public interface SecPicMapper {

    //获取要删除的头像路径
    String picselectgetone(Integer pid);

    //添加头像信息
    void insert_head(SecPic secPic);
}
