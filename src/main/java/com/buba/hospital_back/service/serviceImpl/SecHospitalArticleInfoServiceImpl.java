package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecHospitalArticleInfo;
import com.buba.hospital_back.mapper.SecHospitalArticleInfoMapper;
import com.buba.hospital_back.service.SecHospitalArticleInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecHospitalArticleInfoServiceImpl implements SecHospitalArticleInfoService {
    @Autowired
    private SecHospitalArticleInfoMapper secHospitalArticleInfoMapper;

}
