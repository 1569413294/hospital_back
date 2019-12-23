package com.buba.hospital_back.service;


import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.bean.SelectUrhdm;

public interface SecHospitalUserService {
    /* *
     * 功能概述：添加用户<br>
     * <>
     * @Param:
     * @Return:
     * @Author: Administrator
     * @Date: 2019/12/12 15:28
     */
    public  int  addSecHospitalRelation(SecUser secUser);
    /* *
     * 功能概述：用户管理---修改<br>
     * <>
     * @Param: [hospitalId, adminId, hospitalIds]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/13 11:20
     */
    public  int updateSecHospitalRelation(SelectUrhdm selectUrhdm);
    /* *
     * 功能概述：用户管理--添加医生--用户与医院关联 表<br>
     * <>
     * @Param: [addDoctor]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 14:56
     */
    int addDoctor(AddDoctor addDoctor);
}
