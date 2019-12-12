package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.bean.SecUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: hospital_back
 * @Package: com.buba.hospital_back.mapper
 * @ClassName: SecResMapper
 * @Author: Admin
 * @Description:
 * @Date: 2019/12/10 0010 13:23
 * @Version: 1.0
 */

public interface SecUserMapper {

    //查询权限列表
    List<SecRes> selectRoleRes(Integer id);
    //登录 查看用户信息
    SecUser loadUserInfo(String mobile);
}
