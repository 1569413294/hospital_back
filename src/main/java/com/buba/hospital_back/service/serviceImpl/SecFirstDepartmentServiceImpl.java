package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.DepartmentVo;
import com.buba.hospital_back.bean.SecFirstDepartment;
import com.buba.hospital_back.bean.SecSecondDepartment;
import com.buba.hospital_back.mapper.SecFirstDepartmentMapper;
import com.buba.hospital_back.mapper.SecSecondDepartmentMapper;
import com.buba.hospital_back.service.SecFirstDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SecFirstDepartmentServiceImpl implements SecFirstDepartmentService {


    @Autowired
    private SecFirstDepartmentMapper secFirstDepartmentMapper;

    @Autowired
    private SecSecondDepartmentMapper secSecondDepartmentMapper;
    /*
     * 功能描述: <br>
     * 判断二级科室是否存在
     * @Param: [secondDepartmentName]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/12 0012 8:57
     */
    @Override
    public Integer is_have_secondDepartmentName(String secondDepartmentName) {

        return secSecondDepartmentMapper.is_have_secondDepartmentName(secondDepartmentName);
    }

    /*
     * 功能描述: <br>
     * 判断一级科室是否存在
     * @Param: [departmentName]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/11 0011 19:00
     */
    @Override
    public Integer is_have_departmentName(String departmentName) {
        return secFirstDepartmentMapper.is_have_departmentName(departmentName);
    }

    /*
     * 功能描述: <br>
     * 添加二级科室信息
     * @Param: [secSecondDepartment]
     * @Return: java.lang.Integer
     * @Author: Admin
     * @Date: 2019/12/11 0011 14:14
     */
    @Override
    public Integer add_office_two(SecSecondDepartment secSecondDepartment) {
        if(secSecondDepartment!=null){
            Integer integer = secSecondDepartmentMapper.add_office(secSecondDepartment);
            System.out.println(secSecondDepartment.getFirstDepartmentId());
            return secSecondDepartment.getFirstDepartmentId();
        }
        return null;
    }

    /*
     * 功能描述: <br>
     * 添加一级科室以及二级科室信息
     * @Param: [secFirstDepartment]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/11 0011 8:24
     */
    @Override
    @Transactional
    public Integer add_office(SecFirstDepartment secFirstDepartment, SecSecondDepartment secSecondDepartment) {
        Integer i = 0;
        //如果一级科室对象不为null
        if (secFirstDepartment != null) {
            //添加一级科室信息
            i = secFirstDepartmentMapper.add_office(secFirstDepartment);
        }
        //校验一级科室是否添加成功
        if (i > 0 && secSecondDepartment!=null) {
            //成功添加二级科室
            secSecondDepartment.setFirstDepartmentId(secFirstDepartment.getId());
            //添加二级科室
            Integer integer = secSecondDepartmentMapper.add_office(secSecondDepartment);
            //如果二级科室添加成功
            if(integer>0){
                //返回一级科室主键id 用于回显继续添加二级科室
                return secFirstDepartment.getId();
            }
            return 0;
        }
        return 0;
    }

    /*
     * 功能描述: <br>
     * 查询所有科室信息,以及对应医院的医生数量
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecFirstDepartment>
     * @Author: Admin
     * @Date: 2019/12/11 0011 9:24
     */
    @Override
    public List<DepartmentVo> office_all() {
        return secFirstDepartmentMapper.office_all();
    }
}
