package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.Reply;

import java.util.List;

public interface ReplyService {
    int add(Reply reply);

    List<Reply> findReplyList(Integer id);

    List<Reply> findChildren(Integer id);
}
