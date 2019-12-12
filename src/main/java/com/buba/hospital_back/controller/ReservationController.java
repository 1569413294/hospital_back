package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.ReservationVo;
import com.buba.hospital_back.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author FJ
 * @title: ReservationController
 * @projectName hospital_back
 * @date 2019/12/1110:10
 */
@RequestMapping("reservation")
@Controller
public class ReservationController {
    @Resource
    private ReservationService reservationService;

    @RequestMapping("find_reservation")
    @ResponseBody
    public List<ReservationVo> find_reservation(){
        List<ReservationVo> l=reservationService.find_reservation();
        return l;
    }

}
