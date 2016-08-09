package com.wxt.news.controller;

import com.wxt.news.entity.Messages;
import com.wxt.news.entity.News;
import com.wxt.news.entity.User;
import com.wxt.news.service.MessagesService;
import com.wxt.news.service.NewsService;
import com.wxt.news.service.UserService;
import com.wxt.news.support.Result;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Controller
public class MessagesController {
    @Resource
    private MessagesService messagesService;

    @Resource
    private UserService userService;
    @Resource
    private NewsService newsService;

    @RequestMapping(value = "/messagesList", method = {RequestMethod.GET})
    public String getUserListGet(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        Pageable pageable = new PageRequest(page, 2, Sort.Direction.DESC, "id");
        Page<Messages> messages = messagesService.getMessagesList(pageable);

        model.addAttribute("messages", messages);
        model.addAttribute("nowPage", page + 1);

        return "/admin/messageEdit/index";
    }


    @RequestMapping(value = "/messages/addMessages", method = {RequestMethod.POST})
    public String addMessages(@RequestParam(value = "userName") String userName,
                              @RequestParam(value = "email") String email,
                              @RequestParam(value = "password") String password,
                              @RequestParam(value = "address") String address,
                              @RequestParam() @DateTimeFormat(pattern = "YYYY-MM-dd") Date birthday,
                              @RequestParam(value = "hobby") String[] hobby,
                              @RequestParam(value = "gender") String gender,
                              HttpSession session) {
        Messages messages = new Messages();

        messagesService.saveOrUpdate(messages);


        return "/admin/messageEdit/edit";
    }

    @RequestMapping(value = "/messages/edit", method = {RequestMethod.GET})
    public String userEdit(@RequestParam(value = "id") Long id, Model model) {
        Messages messages = messagesService.getUserById(id);
        model.addAttribute("messages", messages);

        return "/admin/messageEdit/edit";
    }

    @RequestMapping("/messages/toAddJsp")
    public String goToAddJsp(Model model) {
        //取出所有的用户 在 add.jsp循环出来 让用户 选择 是那个 生成评论
        List<User> userList = userService.getAllUser();

        model.addAttribute("userList", userList);

        List<News> newsList = newsService.getAllNews();
        model.addAttribute("newsList", newsList);

        return "/admin/messageEdit/add";
    }

    @RequestMapping("/meassage/saveWxtWoaini")
    public String saveMeassage(@RequestParam("userId") Long userId,
                               @RequestParam("message") String message,
                               @RequestParam("newsId") Long newsId
    ) {
        //因为你是增加 评论
        //所以 这里就要 new 一个 meassage 然后把前台传递过来的值
        //一个一个 塞到   Messages 对象里面去

        User user = userService.getUserById(userId);
        Messages messages = new Messages();

        messages.setAuthor(user.getUserName());
        messages.setMessage(message);
        messages.setPostTime(new Date());

        messages.setUser(user);



        messagesService.saveOrUpdate(messages);
        return "/admin/messageEdit/edit";
    }

    @RequestMapping(value = "/messages/save")
    public String userSave(@ModelAttribute Messages messages, Model model) {

        messagesService.saveOrUpdate(messages);
        model.addAttribute("msg", "保存成功!");
        return "/admin/messageEdit/edit";
    }

    @RequestMapping(value = "/messages/delMessages")
    @ResponseBody
    public Result delUser(@RequestParam(value = "id") Long id) {

        messagesService.delUserById(id);
        return Result.ok();
    }
}
