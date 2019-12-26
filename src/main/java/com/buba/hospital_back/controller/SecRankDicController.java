package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecRankDic;
import com.buba.hospital_back.service.SecRankDicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("SecRankDic")
public class SecRankDicController {

    @Autowired
    private SecRankDicService secRankDicService;

    @RequestMapping("rank_all")
    public List<SecRankDic> rank_all(){
        return secRankDicService.rank_all();
    }


}
