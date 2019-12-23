package com.buba.hospital_back.mapper;

/*import com.buba.hospital_back.bean.AddDoctor;*/
import com.buba.hospital_back.bean.AddDoctor;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.bean.SelectUrhdm;
import org.apache.ibatis.annotations.Param;

public interface SecHospitalUserMapper {
    //添加
    public  int  addSecHospitalRelation(SecUser secUser);
    /* *
     * 功能概述：
     *
     * 参数介绍：hospitalId ：修改的医院值；adminId：登陆者id;hospitalIds:条件医院id
     *
     * <>
     * @Param: [hospitalId, adminId, hospitalIds]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/13 10:48
     */
    //修改
    public  int updateSecHospitalRelation(SelectUrhdm selectUrhdm);
    /* *
       * 功能概述：用户管理--添加医生--用户与医院关联表<br>
       * <>
       * @Param: [addDoctor]     
       * @Return: int  
       * @Author: Administrator 
       * @Date: 2019/12/18 14:56*/
   int addDoctor(AddDoctor addDoctor);
}
