package com.buba.hospital_back.mapper;

import com.buba.hospital_back.bean.HisOrder;
import com.buba.hospital_back.bean.ReservationVo;

import java.util.List;

/**
 * @author FJ
 * @title: ReservationMapper
 * @projectName hospital_back
 * @date 2019/12/1110:16
 */
public interface ReservationMapper {
    List<ReservationVo> find_reservation();

    List<HisOrder> find_hisOrder(HisOrder hisOrder);
}
