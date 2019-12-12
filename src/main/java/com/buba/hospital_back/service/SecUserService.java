package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecHospital;
import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.bean.SecUser;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: hospital_back
 * @Package: com.buba.hospital_back.service
 * @ClassName: SecResService
 * @Author: Admin
 * @Description:
 * @Date: 2019/12/10 0010 11:42
 * @Version: 1.0
 */
@Service
public interface SecUserService {

    //查询权限列表
    List<SecRes> selectRoleRes(Integer id);
    //登录
    SecUser login(String phone);
    //根据权限获取医院列表
    List<SecHospital> getOfHospital();
    List<SecHospital> getOfHospitalById(Integer id);
}
