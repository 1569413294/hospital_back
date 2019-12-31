package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
    //根据权限获取医院列表
    List<SecHospital> getOfHospital();
    List<SecHospital> getOfHospitalById(Integer id);
    //后台管理-->用户管理
    List<SelectUrhdm> selectUrhdm();
    /* *
     * 功能概述：//设置是否有效<br>
     * <>
     * @Param: [id, disabled]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/12 10:30
     */
    int updateUserDisabled (@Param("id") Integer id, @Param("disabled") Integer disabled);
    /* *
     * 功能概述： //添加<br>
     * <>
     * @Param: [secUser]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/12 19:42
     */
    int  addUser(SecUser secUser);
    /* *
     * 功能概述：修改<br>
     * <>
     * @Param: [secuser]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/12 19:44
     */
    int updateUser(SelectUrhdm selectUrhdm);
    /* *
     * 功能概述：添加医生<br>
     * <>
     * @Param: [addDoctor]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 14:00
     */
    int addDoctor(AddDoctor addDoctor);

}
