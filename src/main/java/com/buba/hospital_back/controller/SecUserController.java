package com.buba.hospital_back.controller;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.constant.Constants;
import com.buba.hospital_back.service.SecUserService;
import com.buba.hospital_back.utils.MD5Util;
import com.buba.hospital_back.utils.RedisUtils;
import com.buba.hospital_back.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@Controller
@RequestMapping("user")
public class SecUserController {

    @Autowired
    private SecUserService secUserService;
    @Autowired
    private RedisUtils redisUtils;

    //获取手机验证吗
    @ResponseBody
    @RequestMapping("/getPhoneMsg")
    public boolean getPhoneMsg(String phone,HttpSession session) {
        //随机生成6位数
        int mobileCodes=(int)((Math.random()*9+1)*100000);
        boolean b = redisUtils.set(phone,mobileCodes);
        if(b){
            redisUtils.expire(phone,60);
        }
        System.out.println(mobileCodes);
        //boolean sendMSM = SendSMSUtils.sendMSM(mobile, String.valueOf(mobileCodes));
        return b;
    }
    //验证验证码
    @ResponseBody
    @RequestMapping("/doVirifyMessage")
    public boolean doVirifyMessage(String phone,String messageCode) {
        boolean b =redisUtils.hasKey(phone);
        if(b){
            Object scode = redisUtils.get(phone);
            if(scode.toString() == null) {
                return false;
            }else if(!scode.toString().equals(messageCode)){
                return false;
            }
            return true;
        }else{
            return false;
        }
    }
    //登录
    @ResponseBody
    @RequestMapping("/login")
    public boolean login(String phone, boolean auto_login, HttpServletResponse response, HttpSession session) {
        SecUser secUser = secUserService.login(phone);
        if(secUser!=null){
            session.setAttribute("user",secUser);
            //网页上的密码与数据库内密文密码是否验证通过
            if(auto_login) {
                //创建新的Cookie
                session.setAttribute("user",secUser);
                String uuid = UUIDUtils.getUUID();
                Cookie cookie = new Cookie(Constants.CookieKey, uuid);
                cookie.setMaxAge(60*60);
                cookie.setPath("/");
                response.addCookie(cookie);//返回客户端
                //Redis 里保存当前cookie里对应的信息 key=UUIDUtils value=User
                Object o = redisUtils.hget(Constants.RedisUserKey,uuid);
                if(o==null){
                    redisUtils.hset(Constants.RedisUserKey,uuid,secUser);
                    redisUtils.expire(Constants.RedisUserKey,60*60);
                }
                return true;
            }else{
                System.out.println("session");
                session.setAttribute("user",secUser);
                return true;
            }
        }else{
            return false;
        }
    }
    //自动登录
    @ResponseBody
    @RequestMapping("/auto_login")
    public boolean auto_login(String cookieValue,HttpSession session) {
        System.out.println("自动登录验证");
        SecUser secUser = (SecUser) session.getAttribute("user");
        if(secUser!=null){
           return true;
        }else{
            if(cookieValue!=null){
                SecUser user = (SecUser)redisUtils.hget(Constants.RedisUserKey,cookieValue);
                session.setAttribute("user",user);
                return true;
            }
            return false;
        }
    }
    //用户退出
    @RequestMapping("/loginOut")
    public String  loginOut(HttpServletRequest request,HttpServletResponse response,HttpSession session){

        //根据键删除session中的值
        session.removeAttribute("user");
        session.invalidate();
        String struuid=null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie.getName().equalsIgnoreCase(Constants.CookieKey)) {
                struuid=cookie.getValue();
                if(struuid!=null) {
                    redisUtils.hdel(Constants.RedisUserKey,struuid);
                }
                cookie.setMaxAge(0);
                cookie.setPath("/");  //路径一定要写上，不然销毁不了
                response.addCookie(cookie);
            }
        }

        return "redirect:/jsps/login.jsp";

    }


    /*
     * 功能描述:根据用户权限查看左树列表
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:25
     */
    @ResponseBody
    @RequestMapping("/selectRoleRes")
    public List<SecRes> selectRoleRes(HttpSession session){
       /* SecUser secUser = (SecUser) session.getAttribute("user");
        if(null == secUser){
            return null;
        }*/
        List<SecRes> list=secUserService.selectRoleRes(1);

        return list;
    }



}
