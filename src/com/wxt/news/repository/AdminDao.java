package com.wxt.news.repository;

import com.wxt.news.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface AdminDao extends JpaRepository<Admin, Long> {
    Admin getAdminByLoginNameAndLoginPwd(String loginName, String loginPwd);
}
