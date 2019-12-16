package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.SecRankDic;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SecRankDicMapper {

    @Select("select id,rank_name from sec_rank_dic")
    List<SecRankDic> rank_all();
}
