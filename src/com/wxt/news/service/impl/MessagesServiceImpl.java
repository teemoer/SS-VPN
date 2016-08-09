package com.wxt.news.service.impl;

import com.wxt.news.entity.Messages;
import com.wxt.news.repository.MessagesDao;
import com.wxt.news.service.MessagesService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by teemoer@cntv.cn on 2016/7/3 0003.
 */
@Service("messagesService")
public class MessagesServiceImpl implements MessagesService {
    @Resource
    MessagesDao messagesDao;
    @Override
    public Page<Messages> getMessagesList(Pageable pageable) {
        return messagesDao.findAll(pageable);
    }

    @Override
    public void saveOrUpdate(Messages messages) {
        messagesDao.save(messages);
    }

    @Override
    public void delUserById(Long id) {
        messagesDao.delete(id);
    }

    @Override
    public Messages getUserById(Long id) {
        return messagesDao.findById(id);
    }

    public List<Messages> getAll(){


        return  messagesDao.findAll((root, criteriaQuery, criteriaBuilder) -> null);

        //return messagesDao.findAll((root, criteriaQuery, criteriaBuilder) -> {
        //
        //    return criteriaBuilder.conjunction();
        //});
    }
}
