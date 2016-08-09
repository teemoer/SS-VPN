package com.wxt.news.repository;

import com.wxt.news.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface NewsDao extends JpaRepository<News, Long>, JpaSpecificationExecutor<News> {
    @Query(value = "select ne from News ne where ne.id=:id")
    News getNewsById(@Param("id") Long id);
}
