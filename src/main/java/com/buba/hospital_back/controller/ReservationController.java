package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.HisOrder;
import com.buba.hospital_back.bean.ReservationVo;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.service.ReservationService;
import com.buba.hospital_back.utils.TemplateExcelUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    //预约账单查询
    @RequestMapping("find_reservation")
    @ResponseBody
    public List<ReservationVo> find_reservation(){
        List<ReservationVo> l=reservationService.find_reservation();
        return l;
    }
    //预约账单查询
    @RequestMapping("find_hisOrder")
    @ResponseBody
    public List<HisOrder> find_hisOrder(HisOrder hisOrder){
        List<HisOrder> l=reservationService.find_hisOrder(hisOrder);
        return l;
    }
    //导出Excel
    @RequestMapping("outExecel")
    @ResponseBody
    public boolean outExecel(HttpSession session,HisOrder hisOrder){
        SecUser user = (SecUser) session.getAttribute("user");
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String d= sf.format(new Date());
        //if(user!=null){
        //设置导出文件路径
        String target="D:"+"账单"+d+".xlsx";
        //模板名称
        String temp="\\hisOrder.xlsx";
        //模板路径
        temp=session.getServletContext().getRealPath("template")+temp;
        //设备参数
        String[]  params=new String[2];
        params[0]=d;
        params[1]="狗建";
        //设置list集合把查询的数据存进去
        List<HisOrder> l=reservationService.find_hisOrder(hisOrder);
        //excel表列对应的Javabean的属性
        List<String> propertyList=creaPropertyList();
        TemplateExcelUtil<HisOrder> excelUtil=new TemplateExcelUtil<>();
        excelUtil.exportExcel(temp,target,params,propertyList,l);
        return true;
        // }
    }

    private List<String> creaPropertyList() {
        List<String> pro=new ArrayList<String>();
        pro.add("id");
        pro.add("orderName");
        pro.add("status");
        pro.add("payStartTime");
        pro.add("refundStartTime");
        pro.add("payMoney");
        pro.add("medicalCardNumber");
        return pro;
    }

}
