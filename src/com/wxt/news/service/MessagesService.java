package com.wxt.news.service;

import com.wxt.news.entity.Messages;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
public interface MessagesService {

    Page<Messages> getMessagesList(Pageable pageable);

    void saveOrUpdate(Messages messages);

    void delUserById(Long id);

    Messages getUserById(Long id);
}
