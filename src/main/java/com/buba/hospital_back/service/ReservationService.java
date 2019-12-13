package com.buba.hospital_back.service;

import com.buba.hospital_back.bean.HisOrder;
import com.buba.hospital_back.bean.ReservationVo;

import java.util.List;

/**
 * @author FJ
 * @title: ReservationService
 * @projectName hospital_back
 * @date 2019/12/1110:12
 */
public interface ReservationService {
    List<ReservationVo> find_reservation();

    List<HisOrder> find_hisOrder(HisOrder hisOrder);
}
