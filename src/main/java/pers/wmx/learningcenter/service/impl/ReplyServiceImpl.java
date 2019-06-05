package pers.wmx.learningcenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.ReplyDao;
import pers.wmx.learningcenter.domain.Reply;
import pers.wmx.learningcenter.service.ReplyService;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-14 18:57
 */

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired
    ReplyDao replyDao;

    @Override
    public int add(Reply reply) {
        return replyDao.add(reply);
    }

    @Override
    public List<Reply> findReplyList(Integer id) {
        return replyDao.findReplyList(id);
    }

    @Override
    public List<Reply> findChildren(Integer id) {
        return replyDao.findChildren(id);
    }
}
