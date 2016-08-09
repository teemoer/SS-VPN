package com.wxt.news.controller;

import com.wxt.news.entity.News;
import com.wxt.news.service.NewsService;
import com.wxt.news.support.Result;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Controller
public class NewsController {
    @Resource
    private NewsService newsService;

    @RequestMapping(value = "/newsList", method = {RequestMethod.GET})
    public String getUserListGet(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        Pageable pageable = new PageRequest(page, 2, Sort.Direction.DESC, "id");
        Page<News> newsPage = newsService.getNewsList(pageable);

        model.addAttribute("newsPage", newsPage);
        model.addAttribute("nowPage", page + 1);

        return "/admin/newEdit/index";
    }


    @RequestMapping(value = "/news/addNews", method = {RequestMethod.GET})
    public String addNews( ) {

        return "/admin/newEdit/edit";
    }

    @RequestMapping(value = "/toNews")
    public String goToNews() {

        return "/web/news";
    }

    @RequestMapping(value = "/toNews", method = {RequestMethod.GET})
    public String goToNews(@RequestParam(value = "page", defaultValue = "0") int page, Model model) {
        Pageable pageable = new PageRequest(page, 3, Sort.Direction.DESC, "id");
        Page<News> newsPage = newsService.getNewsList(pageable);
        model.addAttribute("newsPage", newsPage);
        model.addAttribute("nowPage", page + 1);
        System.out.println(1);
        return "/web/news";
    }

    @RequestMapping(value = "/news/edit", method = {RequestMethod.GET})
    public String userEdit(@RequestParam(value = "id") Long id, Model model) {
        News news = newsService.getNewsById(id);
        model.addAttribute("news", news);

        return "/admin/newEdit/edit";
    }

    @RequestMapping(value = "/news/save")
    public String userSave(@ModelAttribute News news, Model model) {
        news.setSubmitDate(new Timestamp(new Date().getTime()));
        newsService.saveOrUpdate(news);

        model.addAttribute("msg", "保存成功!");
        return "/admin/newEdit/edit";
    }

    @RequestMapping(value = "/news/delNews")
    @ResponseBody
    public Result delUser(@RequestParam(value = "id") Long id) {
        newsService.delNewsById(id);
        return Result.ok();
    }
}
