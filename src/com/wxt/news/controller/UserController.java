package com.wxt.news.controller;

import com.wxt.news.entity.User;
import com.wxt.news.service.UserService;
import com.wxt.news.support.Result;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping(value = "/userList", method = {RequestMethod.GET})
    public String getUserListGet(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        Pageable pageable = new PageRequest(page, 2, Sort.Direction.DESC, "id");
        Page<User> userPage = userService.getUserList(pageable);

        model.addAttribute("userPage", userPage);
        model.addAttribute("nowPage", page + 1);

        return "/user/userList";
    }






    @RequestMapping(value = "/registerUser", method = {RequestMethod.POST})
    public String registerUser( HttpSession session) {
        User user = new User();



        userService.saveOrUpdate(user);


        return "/web/index";
    }

    @RequestMapping(value = "/user/edit", method = {RequestMethod.GET})
    public String userEdit(@RequestParam(value = "id") Long id, Model model) {
        User user = userService.getUserById(id);
        System.out.println(user.toString());
        model.addAttribute("user", user);

        return "/user/edit";
    }

    @RequestMapping(value = "/user/save")
    public String userSave(@ModelAttribute User user, Model model) {

        userService.saveOrUpdate(user);
        model.addAttribute("msg", "保存成功!");
        return "/user/edit";
    }

    @RequestMapping(value = "/user/delUser")
    @ResponseBody
    public Result delUser(@RequestParam(value = "id") Long id) {

        userService.delUserById(id);
        return Result.ok();
    }
}
