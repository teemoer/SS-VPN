package com.wxt.news.service.impl;

import com.wxt.news.entity.News;
import com.wxt.news.repository.NewsDao;
import com.wxt.news.service.NewsService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService {
    @Resource
    private NewsDao newsDao;

    @Override
    public void delUserById(Long id) {
        newsDao.delete(id);
    }

    @Override
    public Page<News> getNewsList(Pageable pageable) {
        return newsDao.findAll(pageable);
    }

    @Override
    public void saveOrUpdate(News news) {
        newsDao.save(news);
    }

    @Override
    public News getNewsById(Long id) {
        return newsDao.getNewsById(id);
    }

    @Override
    public void delNewsById(Long id) {
        newsDao.delete(id);
    }

    @Override
    public List<News> getAllNews() {
        return newsDao.findAll();
    }


}
