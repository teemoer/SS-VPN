package com.wxt.news.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Entity
@Table(name = "admin")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Admin extends IdEntity {

    // Fields
    private String loginName;
    private String loginPwd;


    // Constructors

    /**
     * default constructor
     */
    public Admin() {
    }




    @Column(name = "login_name", nullable = false, length = 80)
    public String getLoginName() {
        return this.loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "login_pwd", nullable = false, length = 80)
    public String getLoginPwd() {
        return this.loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }


}