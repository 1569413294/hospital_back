package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SecHospitalMapper {


    //查询指定医院下所有的二级科室
    List<SecSecondDepartment> hospital_change(Integer hospitalId);
    /* *
     * 功能概述：//所属医院<br>
     * <>
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.mapper.SecHospital>
     * @Author: Administrator
     * @Date: 2019/12/12 8:30
     */
    public List<SecHospital> allHospital();
    /* *
     * 功能概述：医院介绍<br>
     * <>
     * @Param: [secHospital]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/22 20:03
     */
    int updatehospitaljieshao(SecHospitalArticle secHospitalArticle);
    /* *
     * 功能概述：医院管理<br>
     * <>
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SelectYygl>
     * @Author: Administrator
     * @Date: 2019/12/13 16:15
     */
    public  List<SelectYygl> allYongHugunLi();
    /* *
     * 功能概述：  //添加医院<br>
     * <>
     * @Param: [selectYygl]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/14 14:04
     */
    int addYiYuanGuanLi(SelectYygl selectYygl);
    /* *
     * 功能概述：添加医院全称）——校验<br>
     * <>
     * @Param: [hospitalName]
     * @Return: com.buba.hospital_back.bean.SecHospital
     * @Author: Administrator
     * @Date: 2019/12/17 15:34
     */
    public  String  seleSecHospital (@Param("hospitalName") String hospitalName);
    /* *
     * 功能概述：添加医院简称）——校验<br>
     * <>
     * @Param: [hospitalName]
     * @Return: com.buba.hospital_back.bean.SecHospital
     * @Author: Administrator
     * @Date: 2019/12/17 15:34
     */
    public  String  selecthospitalSort (@Param("hospitalSort") String hospitalSort);
    /* *
     * 功能概述：修改医院全称与简称<br>
     * <>
     * @Param: [hospitalName, hospitalSort]
     * @Return: int
     * @Author: Administrator
     * @Date: 2019/12/18 19:31
     */
    int updateHospital(SecHospital secHospital);
/* *   
   * 功能概述：医院介绍 ---获取首页医院<br>
   * <>
   * @Param: [hospitalId]     
   * @Return: java.lang.String  
   * @Author: Administrator 
   * @Date: 2019/12/30 9:24
   */
    String gitHospitalName(Integer hospitalId);
}
