package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.service.SecResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ProjectName: hospital_back
 * @Package: com.buba.hospital_back.controller
 * @ClassName: SecResController
 * @Author: Admin
 * @Description: 权限控制层
 * @Date: 2019/12/10 0010 11:41
 * @Version: 1.0
 */
@Controller
public class SecResController {

    @Autowired
    private SecResService secResService;

    /*
     * 功能描述:权限菜单查询
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:25
     */
    @RequestMapping("res_all")
    @ResponseBody
    public List<SecRes> res_all(){
        return secResService.res_all();
    }

}
