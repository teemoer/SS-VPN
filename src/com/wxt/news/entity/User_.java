package com.wxt.news.entity;

import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */

@StaticMetamodel(User.class)
public class User_ {

    public static volatile SingularAttribute<User, Long> id;

    public static volatile SingularAttribute<User, String> userName;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, String> email;

    public static volatile SetAttribute<User, Messages> messageses;


}
