package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.ReservationVo;
import com.buba.hospital_back.mapper.ReservationMapper;
import com.buba.hospital_back.service.ReservationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author FJ
 * @title: ReservationServiceImpl
 * @projectName hospital_back
 * @date 2019/12/1110:12
 */
@Service
public class ReservationServiceImpl implements ReservationService {
    @Resource
    private ReservationMapper reservationMapper;

    @Override
    public List<ReservationVo> find_reservation() {
        return reservationMapper.find_reservation();
    }
}
