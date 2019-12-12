package com.buba.hospital_back.utils;

import java.util.UUID;

/**
 * @ClassName UUIDUtils
 * @Description TODO
 * @Created by Administrator on 2019/12/11 20:49
 * @Version 1.0
 **/
public class UUIDUtils {
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }
}
