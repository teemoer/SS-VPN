package com.wxt.news.service;

import com.wxt.news.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface UserService {
    Page<User> getUserList(Pageable pageable);

    User getUserByNameAndPwd(String name, String pwd);

    void saveOrUpdate(User user);

    User getUserById(Long id);
    void saveUser(User user);

    void delUserById(Long id);

    List<User> getAllUser();

    User getUserByLoginName(String userName);

}
