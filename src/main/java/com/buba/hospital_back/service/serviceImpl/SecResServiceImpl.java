package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.mapper.SecResMapper;
import com.buba.hospital_back.service.SecResService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ProjectName: hospital_back
 * @Package: com.buba.hospital_back.service.serviceImpl
 * @ClassName: SecResServiceImpl
 * @Author: Admin
 * @Description:
 * @Date: 2019/12/10 0010 13:22
 * @Version: 1.0
 */
@Service
public class SecResServiceImpl  implements SecResService {

    @Autowired
    private SecResMapper secResMapper;

    /*
     * 功能描述:权限菜单查询
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:24
     */
    @Override
    public List<SecRes> res_all() {
        return secResMapper.res_all();
    }
}
