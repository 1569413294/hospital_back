package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecRole;
import com.buba.hospital_back.service.SecRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("secrole")
@Controller
public class SecRoleController {
    @Autowired
    private SecRoleService secRoleService;

    @RequestMapping("/allRole")
    @ResponseBody
    public List<SecRole> allRole(){
        List<SecRole> secRoles = secRoleService.allSecRole();
        for (SecRole r:secRoles
             ) {
            System.out.println("角色列表："+r);
        }
        if (secRoles!=null){
            return secRoles;
        }
        return null;
    }
}
