package com.wxt.news.service.impl;

import com.google.common.collect.Lists;
import com.wxt.news.entity.User;
import com.wxt.news.entity.User_;
import com.wxt.news.repository.UserDao;
import com.wxt.news.service.UserService;
import org.javasimon.aop.Monitored;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Service("userService")
@Transactional
@Monitored
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Override
    public Page<User> getUserList(Pageable pageable) {
        return userDao.findAll(pageable);
    }

    @Override
    public User getUserByNameAndPwd(String name, String pwd) {
        return userDao.findUserByUserNameAndPassword(name, pwd);
    }

    @Override
    public void saveOrUpdate(User user) {

        userDao.save(user);
    }

    @Override
    public User getUserById(Long id) {
        return userDao.findUserById(id);
    }

    @Override
    public void saveUser(User user) {
        userDao.saveAndFlush(user);
    }

    @Override
    public void delUserById(Long id) {
        userDao.delete(id);
    }

    @Override
    public List<User> getAllUser() {

        return userDao.findAll();
    }

    @Override
    public User getUserByLoginName(String userName) {
        return userDao.findOne(new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder
                    criteriaBuilder) {
                List<Predicate> predicateList= Lists.newArrayList();
                predicateList.add(criteriaBuilder.equal(root.get(User_.userName),userName));

                return criteriaBuilder.and(predicateList.toArray(new Predicate[predicateList.size()]));
            }
        });
    }
}
