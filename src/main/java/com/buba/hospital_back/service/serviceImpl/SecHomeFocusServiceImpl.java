package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecPic;
import com.buba.hospital_back.mapper.SecHomeFocusMapper;
import com.buba.hospital_back.service.SecHomeFocusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName SecHomeFocusServiceImpl
 * @Description TODO
 * @Created by Administrator on 2019/12/16 15:58
 * @Version 1.0
 **/
@Service
public class SecHomeFocusServiceImpl implements SecHomeFocusService {

    @Resource
    private SecHomeFocusMapper secHomeFocusMapper;

    //分页查询所有首页焦点图
    @Override
    public List<SecPic> queryAllFocusPic(int page, int limit, Integer hospitalId) {
        return secHomeFocusMapper.queryAllFocusPic(page,limit,hospitalId);
    }
    //查询首页焦点图总数
    @Override
    public int queryCountFocusPic(Integer hospitalId) {
        return secHomeFocusMapper.queryCountFocusPic(hospitalId);
    }
    //获取展示顺序
    @Override
    public int getSequence(Integer hospitalId) {
        return secHomeFocusMapper.getSequence(hospitalId);
    }
    //上传首页焦点图
    @Override
    public int uploadHomeFocusPic(SecPic secPic) {
        return secHomeFocusMapper.uploadHomeFocusPic(secPic);
    }
    //删除首页焦点图
    @Override
    public int delHomeFocusPic(Integer id) {
        return secHomeFocusMapper.delHomeFocusPic(id);
    }
}
