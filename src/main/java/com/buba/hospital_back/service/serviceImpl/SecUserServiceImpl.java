package com.buba.hospital_back.service.serviceImpl;

import com.buba.hospital_back.bean.SecRes;
import com.buba.hospital_back.mapper.SecUserMapper;
import com.buba.hospital_back.service.SecUserService;
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
public class SecUserServiceImpl implements SecUserService {

    @Autowired
    private SecUserMapper secUserMapper;

    /*
     * 功能描述:权限菜单查询
     * @Param: []
     * @Return: java.util.List<com.buba.hospital_back.bean.SecRes>
     * @Author: ggx
     * @Date: 2019/12/10 0010 13:24
     */
    @Override
    public List<SecRes> res_all() {
        return secUserMapper.res_all();
    }
}
