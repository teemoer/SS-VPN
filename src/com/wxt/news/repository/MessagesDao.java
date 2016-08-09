package com.wxt.news.repository;

import com.wxt.news.entity.Messages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface MessagesDao extends JpaRepository<Messages, Long>,JpaSpecificationExecutor<Messages> {
    @Query(value = "select me from Messages me where me.id=:id")
    Messages findById(@Param("id") Long id);
}
