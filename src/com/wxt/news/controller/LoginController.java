package com.wxt.news.controller;

import com.google.code.kaptcha.Producer;
import com.wxt.news.entity.Admin;
import com.wxt.news.entity.User;
import com.wxt.news.security.SecuritySupport;
import com.wxt.news.service.AdminService;
import com.wxt.news.service.UserService;
import com.wxt.news.support.Constants;
import com.wxt.news.support.Result;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by teemoer@cntv.cn on 2016/7/2 0002.
 */
@Controller
public class LoginController {
    @Resource
    private UserService userService;

    @Resource
    AdminService adminService;

    //  Producer 是 Kaptcha 框架提供的一个类
    // 我在 applicationContext.xml 的第53到81行代码定义了这个类 叫 captchaProducer 你必须去看哈
    //所以我使用 @Resource 并且我这个属性的名字叫 captchaProducer 他就会给我自动注入
    @Resource
    Producer captchaProducer;


    /**
     * 跳转到后台登录页面
     *
     * @return
     */
    @RequestMapping(value = "/admin/login")
    public String goToAdminLogin() {

        return "/admin/login";
    }

    @RequestMapping(value = "/admin/loginChack")
    public String adminLoginChack(@RequestParam("name") String name, @RequestParam(value = "pwd") String pwd, Model model) {
        String msg = "登录失败,用户名或者密码错误!";
        try {
            Admin admin = adminService.getAdminByNameAndPwd(name, pwd);
            //如果有这个用户 就跳转到后台首页
            if (admin != null) {
                return "/admin/index";
            }
        } catch (Exception e) {
            msg = "出现错误!";
        }

        //成功没 admin用户 那么说明用户名或者密码错误 就跳转到 后台登录页面
        model.addAttribute("error", msg);
        return "/admin/login";
    }



    @RequestMapping(value = "/web/loginChack")
    public String login(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String username,
                        @RequestParam(FormAuthenticationFilter.DEFAULT_PASSWORD_PARAM) String password,
                        @RequestParam(value = FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, defaultValue =
                                "false") boolean rememberMe,
                        Model model, HttpServletRequest request) {
        String msg = "登录失败,用户名或者密码错误!";
        Subject subject = SecurityUtils.getSubject();
        if (StringUtils.isEmpty(username)) {
            return "login";
        }

        boolean needLogin = !subject.isAuthenticated();

        if (subject.isAuthenticated()) {
            User user = SecuritySupport.getUser();
            if ( StringUtils.equals(user.getUserName(), username)) {
                subject.logout();
                needLogin = true;
            }
        }


        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(rememberMe);
        if (!subject.isAuthenticated()) {
            String error = null;
            try {
                subject.login(token);
            } catch (UnknownAccountException | IncorrectCredentialsException e) {
                error = "用户名/密码错误";
            } catch (DisabledAccountException e) {
                error = "帐户未审核或被锁定";
            } catch (AuthenticationException e) {
                //其他错误，比如锁定，如果想单独处理请单独catch处理
                error = "其他未知错误";
                e.printStackTrace();
            }
            if (StringUtils.isNotEmpty(error)) {
                model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
                model.addAttribute("error", error);
                System.out.println("login error:" + error);
                return "/web/login";
            }
        }


        HttpSession session = request.getSession(true);
        session.setAttribute(Constants.CURRENT_USER, SecuritySupport.getUser());

        return "/web/index";
    }

    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpSession session) {
        String msg = "登录失败,用户名或者密码错误!";
        session.setAttribute("isLogin", false);
        session.setAttribute("user", null);
        return "/web/index";
    }

    @RequestMapping(value = "/web/head")
    public String getHead() {
        return "/web/layout/header";
    }


    /**
     * 跳转到普通用户登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public String goToLogin() {
        return "/web/login";
    }

    /**
     * 跳转到普通用户注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register")
    public String goToRegister() {
        return "/web/register";
    }


    /**
     * 跳转到前台首页
     *
     * @return
     */
    @RequestMapping(value = "/index")
    public String goToIndex() {
        return "/web/index";
    }


    /**
     * 向客户端返回图片
     * <p>
     * 当用户访问这个地址 就会  自动注入   request 和   response
     * 并且 我们设置   response 的响应头 说明这个一张图片
     * 你在浏览器地址 输入    http://127.0.0.1:8080/getYzmImage  就能看到效果了
     *     你要用他的话  只需要在页面上面定一个img   就行了
     *     <img src="${ctx}//getYzmImageg" alt="验证码">
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/web/pub/getYzmImage")
    public ModelAndView getYzm(HttpServletRequest request, HttpServletResponse response) {
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        //获得验证码
        String capText = captchaProducer.createText();
        //设置验证码到session
        request.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, capText);
        //通过验证码获得图片 的流对象
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = null;
        try {
            //获得  response 的输出流  用来向客户端输出图片
            out = response.getOutputStream();
            //输出流   ImageIO 是java提供的一个 图片输出对象
            //bi指的是 你要传输的图片的流对象,  jpg代表图片的格式,   out 指的是你要用那个流往外输出
            ImageIO.write(bi, "jpg", out);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //因为我们已经在  response.getOutputStream();ImageIO.write(bi, "jpg", out); 输出图片数据了
        //所以我们就不要返回 jsp 页面或者 其他东西  所以就返回 null
        return null;
    }

    @RequestMapping(value = "/web/pub/checkVerificationCode")
    @ResponseBody     //因为前台是 ajax访问这个方法 所以就需要写    @ResponseBody 代表 这个方法是给ajax提供访问的 不会跳转页面
    // 只会返回字符串或者一些你想返回的信息比如  checkVerificationCode()这个方法 我返回的是 真或者假
    public Result checkVerificationCode(@RequestParam("verifyCode") String verifyCode,
                                        HttpServletRequest request) {
        //从session获取我们之前在  getYzm 方法的  153行代码中放入session的值
        // request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
        String kaptchaExpected = (String) request.getSession()
                .getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        String kaptchaReceived = verifyCode;
        //判断 之前 我们放入session的验证码和前台传递过来的值是否相等
        if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected)) {
            //不等于或者为空就是验证码错误
            return Result.fail();
        } else {

            return Result.ok();
        }

    }

}
