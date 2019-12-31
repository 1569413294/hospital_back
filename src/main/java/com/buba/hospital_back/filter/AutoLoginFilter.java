package com.buba.hospital_back.filter;

import com.buba.hospital_back.bean.SecUser;
import com.buba.hospital_back.service.SecUserService;
import com.buba.hospital_back.utils.CookieUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
/**
 * 定义拦截器
 */

/**
 * @ClassName AutoLoginFilter
 * @Description TODO
 * @Created by Administrator on 2019/12/11 19:50
 * @Version 1.0
 **/

public class AutoLoginFilter  implements Filter {



    @Autowired
    private SecUserService secUserService;
    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        System.out.println("Filter销毁中");
    }

    /**
     * @see Filter#
     */
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        try {
            HttpServletRequest request = (HttpServletRequest) req;

            //先判断，现在session中还有没有那个userBean.
            SecUser secUser = (SecUser) request.getSession().getAttribute("user");
            //还有，有效。
            if(secUser != null){
                System.out.println("session未失效");
                chain.doFilter(request, response);
            }else{
                //代表session失效了。
                //2. 看cookie。
                //1. 来请求的时候，先从请求里面取出cookie , 但是cookie有很多的key-value
                Cookie[] cookies = request.getCookies();
                //2. 从一堆的cookie里面找出我们以前给浏览器发的那个cookie
                Cookie cookie = CookieUtil.findCookie(cookies, "auto_login");
                //第一次登录
                if(cookie  == null){
                    System.out.println("cookie为空");
                    chain.doFilter(request, response);
                }else{
                    //不是第一次存。
                    String value = cookie.getValue();
                    System.out.println("cookie中的数据:"+value);
                    //完成登录
                    secUser = secUserService.login(value);
                    //使用session存这个值到域中，方便下一次未过期前还可以用。
                    request.getSession().setAttribute("user", secUser);
                    chain.doFilter(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            chain.doFilter(req, response);
        }
    }


    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        	System.out.println("Filter初始化中");
    }

}
