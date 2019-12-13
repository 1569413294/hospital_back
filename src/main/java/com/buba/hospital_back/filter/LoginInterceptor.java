package com.buba.hospital_back.filter;

import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.constant.Constants;
import com.buba.hospital_back.service.SecUserService;
import com.buba.hospital_back.utils.CookieUtil;
import com.buba.hospital_back.utils.RedisUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * @ClassName AutoLoginInterceptor
 * @Description TODO
 * @Created by Administrator on 2019/12/11 20:27
 * @Version 1.0
 **/
/**
 * 定义拦截器
 */
@Component
public class LoginInterceptor  implements HandlerInterceptor {

    @Autowired
    private SecUserService secUserService;
    @Autowired
    private RedisUtils redisUtils;

    //获取前端塞在请求头header里面的accessToken字段的值，然后进行验证与解析

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception {


        try {
            //先判断，现在session中还有没有那个userBean.
            SecUser secUser = (SecUser) request.getSession().getAttribute("user");
            //还有，有效。
            if(secUser != null){
                System.out.println("session未失效");
                return true;
            }else{
                String struuid=null;
                //代表session失效了。
                //2. 看cookie。
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if(cookie.getName().equalsIgnoreCase(Constants.CookieKey)) {
                        struuid=cookie.getValue();
                    }
                }
                if(struuid==null) {
                    System.out.println("验证不通过");
                    System.out.println("UUID不存在");
                    response.sendRedirect(request.getContextPath()+"/user/loginOut");
                    return false;
                }
                //Redis里保存当前cookie里对应的信息 key=UUIDUtils
                SecUser user = (SecUser) redisUtils.hget(Constants.RedisUserKey,struuid);
                if(user==null) {
                    System.out.println("验证不通过");
                    response.sendRedirect(request.getContextPath()+"/user/loginOut");
                    return false;
                }else{
                    System.out.println("验证通过");
                    return true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }
}
