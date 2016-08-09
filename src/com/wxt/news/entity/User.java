package com.wxt.news.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Entity
@Table(name = "user")
public class User extends IdEntity {

    private String userName;
    private String password;
    private String email;

    private String salt;
    private Set<Messages> messageses = new HashSet<Messages>(0);

    // Constructors

    /**
     * default constructor
     */
    public User() {
    }

    /**
     * minimal constructor
     */
    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    @Column(name = "salt", length = 255)
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }





    @Column(name = "user_name", nullable = false, length = 100)
    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "password", nullable = false, length = 100)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "email", length = 100)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
    @JsonIgnore
    public Set<Messages> getMessageses() {
        return this.messageses;
    }

    public void setMessageses(Set<Messages> messageses) {
        this.messageses = messageses;
    }
}
