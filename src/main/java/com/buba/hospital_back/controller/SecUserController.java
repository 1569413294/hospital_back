package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.service.SecUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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
@RestController
@RequestMapping("user")
public class SecUserController {

    @Autowired
    private SecUserService secUserService;

    /*
     * 功能描述:根据用户权限查看左树列表
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:25
     */
    @RequestMapping("selectRoleRes")
    public List<SecRes> selectRoleRes(HttpSession session){
        SecUser secUser = (SecUser) session.getAttribute("user");
        if(null == secUser){
            return null;
        }
        List<SecRes> list=secUserService.selectRoleRes(1);
        return list;
    }

}
