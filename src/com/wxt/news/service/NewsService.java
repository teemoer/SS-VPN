package com.wxt.news.service;

import com.wxt.news.entity.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface NewsService {
    void delUserById(Long id);

    Page<News> getNewsList(Pageable pageable);

    void saveOrUpdate(News news);

    News getNewsById(Long id);

    void delNewsById(Long id);

    List<News> getAllNews();

}
