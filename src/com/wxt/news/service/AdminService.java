package com.wxt.news.service;

import com.wxt.news.entity.Admin;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface AdminService {
    Admin getAdminByNameAndPwd(String name,String pwd);
}
