package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.SecRes;
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
}
