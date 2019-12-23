package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecRole;
import com.buba.hospital_back.mapper.SecRoleMapper;
import com.buba.hospital_back.service.SecRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SecRoleServiceImpl implements SecRoleService {
@Autowired
    private SecRoleMapper secRoleMapper;

    /* *
       * 功能概述：所有角色<br>
       * <>
       * @Param: []
       * @Return: java.util.List<com.buba.hospital_back.bean.SecRole>
       * @Author: Administrator
       * @Date: 2019/12/12 9:05
       */
    @Override
    public List<SecRole> allSecRole() {
        return secRoleMapper.allSecRole();
    }
}
