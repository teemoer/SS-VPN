package com.wxt.news.service.impl;

import com.wxt.news.entity.Admin;
import com.wxt.news.repository.AdminDao;
import com.wxt.news.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    AdminDao adminDao;

    @Override
    public Admin getAdminByNameAndPwd(String name, String pwd) {

        return adminDao.getAdminByLoginNameAndLoginPwd(name, pwd);
    }
}
