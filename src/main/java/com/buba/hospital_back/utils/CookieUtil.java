package com.buba.hospital_back.utils;

import javax.servlet.http.Cookie;

/**
 * @ClassName CookieUtil
 * @Description TODO
 * @Created by Administrator on 2019/12/11 19:50
 * @Version 1.0
 **/
public class CookieUtil {
    public static Cookie findCookie(Cookie [] cookies , String name){
        if(cookies != null){
            for (Cookie cookie : cookies) {
                if(name.equals(cookie.getName())){
                    return cookie;
                }
            }
        }
        return null;
    }

}
