package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecRankDic;
import com.buba.hospital_back.mapper.SecRankDicMapper;
import com.buba.hospital_back.service.SecRankDicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SecRankDicServiceImpl  implements SecRankDicService {

    @Autowired
    private SecRankDicMapper secRankDicMapper;


    @Override
    public List<SecRankDic> rank_all() {
        return secRankDicMapper.rank_all();
    }
}
