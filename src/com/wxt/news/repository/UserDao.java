package com.wxt.news.repository;

import com.wxt.news.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface UserDao extends JpaRepository<User, Long>,JpaSpecificationExecutor<User> {

    User findUserByUserNameAndPassword(String userName, String password);

    @Query(value = "select u from User u where u.id=:id ")
    User findUserById(@Param("id") Long id);


}
