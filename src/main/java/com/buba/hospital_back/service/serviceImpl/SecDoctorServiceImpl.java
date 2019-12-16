package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.*;
import com.buba.hospital_back.mapper.SecDoctorAssistantMapper;
import com.buba.hospital_back.mapper.SecDoctorMapper;
import com.buba.hospital_back.mapper.SecDoctorMultipointMapper;
import com.buba.hospital_back.mapper.SecPicMapper;
import com.buba.hospital_back.service.SecDoctorService;
import com.buba.hospital_back.utils.OSSUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class SecDoctorServiceImpl implements SecDoctorService {

    @Autowired
    private SecDoctorMapper secDoctorMapper;

    @Autowired
    private SecDoctorMultipointMapper secDoctorMultipointMapper;

    @Autowired
    private SecDoctorAssistantMapper secDoctorAssistantMapper;

    @Autowired
    private SecPicMapper secPicMapper;

    /*
     * 功能描述: <br>
     * 添加医生信息
     * @Param: [hos_de, zhucc, secDoctor, file]
     * @Return: java.lang.Boolean
     * @Author: Admin
     * @Date: 2019/12/16 0016 14:28
     */
    @Override
    @Transactional
    public Boolean add_doctor(String[] hos_de, Integer[] zhucc, SecDoctor secDoctor, MultipartFile file) {
        //添加医生表
        Integer i = secDoctorMapper.add_doctor(secDoctor);
        //定义医生医院科室表对象
        SecDoctorMultipoint secDoctorMultipoint = null;
        SecDoctorAssistant secDoctorAssistant = null;
        SecPic secPic  = null;
        //如i>0 代表添加成功
        if (i > 0) {
            //校验多点执业医院
            if (hos_de.length > 0 && hos_de!=null) {
                //循环添加医院医生科室中间表
                for (int j = 0; j < hos_de.length; j++) {
                    String s = hos_de[j];
                    if (s.contains("@")) {
                        //截取医院id
                        Integer hoid = Integer.parseInt(s.substring(0, s.indexOf("@")));
                        //截取对应二级科室id
                        Integer deid = Integer.parseInt(s.substring(s.substring(0, s.indexOf("@")).length() + 1, s.length()));
                        //实例医生医院科室中间表
                        secDoctorMultipoint = new SecDoctorMultipoint();
                        //设置状态
                        secDoctorMultipoint.setStatus("1");
                        //设置医生id
                        secDoctorMultipoint.setDoctorId(secDoctor.getId());
                        //设置医院id
                        secDoctorMultipoint.setHospitalId(hoid);
                        //设置科室id
                        secDoctorMultipoint.setDepartmentId(deid);
                        //添加医生医院科室管理表
                        Integer ii = secDoctorMultipointMapper.add_ho_de(secDoctorMultipoint);

                    }
                }
            }
            if(zhucc.length>0 && hos_de!=null){
                //循环添加助理表
                for (int k = 0; k <zhucc.length ; k++) {
                    secDoctorAssistant = new SecDoctorAssistant();
                    //设置 助理
                    secDoctorAssistant.setAssistantId(zhucc[k]);
                    //设置对应医生id
                    secDoctorAssistant.setDoctorId(secDoctor.getId());
                    //添加助理中间表
                    Integer iii =  secDoctorAssistantMapper.add_as(secDoctorAssistant);
                }
            }
            try {
                if(file!=null){
                    String s = OSSUtil.uploadImageToOSS(file.getOriginalFilename(), file.getInputStream());
                    //添加头像信息
                    secPic = new SecPic();
                    secPic.setStatus("1");
                    secPic.setDisabled(true);
                    secPic.setType("头像");
                    secPic.setObjId(secDoctor.getId());
                    secPic.setObjType("医生");
                    secPic.setPicName(file.getOriginalFilename());
                    secPic.setPicSize(file.getSize()+"");
                    secPic.setPicPath(s);
                    secPicMapper.insert_head(secPic);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            return true;

        }
        return false;
    }

    /*
     * 功能描述: <br>
     * 查询医院下对应的医生
     * @Param: [hospitalId]
     * @Return: java.util.List<com.buba.hospital_back.bean.DoctorVo>
     * @Author: Admin
     * @Date: 2019/12/16 0016 9:10
     */
    @Override
    public List<DoctorVo> doctor_al(Integer hospitalId) {
        return secDoctorMapper.doctor_al(hospitalId);
    }

    /*
     * 功能描述: <br>
     * 查询所有医院信息
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.DoctorVo>
     * @Author: Admin
     * @Date: 2019/12/13 0013 9:34
     */
    @Override
    public List<SecHospital> hospital_all(Integer hospitalId) {
        return secDoctorMapper.hospital_all(hospitalId);
    }

    /*
     * 功能描述: <br>
     * 查询所有医生信息
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.DoctorVo>
     * @Author: Admin
     * @Date: 2019/12/12 0012 15:37
     */
    @Override
    public List<DoctorVo> doctor_all() {
        return secDoctorMapper.doctor_all();
    }
}
