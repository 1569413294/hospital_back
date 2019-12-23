package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.mapper.SecUserMapper;
import com.buba.hospital_back.service.SecUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: hospital_back
 * @Package: com.buba.hospital_back.service.serviceImpl
 * @ClassName: SecResServiceImpl
 * @Author: Admin
 * @Description:
 * @Date: 2019/12/10 0010 13:22
 * @Version: 1.0
 */
@Service
public class SecUserServiceImpl implements SecUserService {

    @Autowired
    private SecUserMapper secUserMapper;

    /**
     * 功能描述:查询权限列表
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:24
     */
    @Override
    public List<SecRes> selectRoleRes(Integer id) {
        return secUserMapper.selectRoleRes(id);
    }
    //登录
    @Override
    public SecUser login(String phone) {
        return secUserMapper.loadUserInfo(phone);
    }
    //根据权限获取医院列表
    @Override
    public List<SecHospital> getOfHospital() {
        return secUserMapper.getOfHospital();
    }
    @Override
    public List<SecHospital> getOfHospitalById(Integer id) {
        return secUserMapper.getOfHospitalById(id);
    }

    @Override
    public List<SelectUrhdm> selectUrhdm() {
        return secUserMapper.selectUrhdm();
    }

    @Override
    public int updateUserDisabled(Integer id, Integer disabled) {
        return secUserMapper.updateUserDisabled(id,disabled);
    }

    @Override
    public int addUser(SecUser secUser) {
        return secUserMapper.addUser(secUser);
    }

    @Override
    public int updateUser(SelectUrhdm selectUrhdm) {
        return secUserMapper.updateUser(selectUrhdm);
    }
    /* *
     * 功能概述：添加 医生 <br>
     * <>
     * @Param: [addDoctor]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 14:30
     */
    @Override
    public int addDoctor(AddDoctor addDoctor) {
        return secUserMapper.addDoctor(addDoctor);
    }
}
