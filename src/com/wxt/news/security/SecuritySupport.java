package com.wxt.news.security;

import com.wxt.news.entity.User;
import org.apache.shiro.SecurityUtils;

/**
 * Created by yanbin on 11/8/15.
 */
public class SecuritySupport extends SecurityUtils {
    public static User getUser() {
        return (User) getSubject().getPrincipal();
    }

    public static Long getUserId() {
        User user = getUser();
        if (null != user) return user.getId();
        return null;
    }

}
