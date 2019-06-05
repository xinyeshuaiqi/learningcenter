package pers.wmx.learningcenter.service.impl;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.TopicDao;
import pers.wmx.learningcenter.domain.RecordDisLike;
import pers.wmx.learningcenter.domain.RecordLike;
import pers.wmx.learningcenter.domain.Topic;
import pers.wmx.learningcenter.service.TopicService;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-14 18:57
 */
@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    TopicDao topicDao;

    @Override
    public int add(Topic topic) {
        return topicDao.add(topic);
    }

    @Override
    public List<Topic> findTopicList(Integer userId) {
        return topicDao.findTopicList(userId);
    }

    @Override
    public int deleteById(Integer id) {
        return topicDao.deleteById(id);
    }

    @Override
    public Topic findById(Integer id) {
        return topicDao.findById(id);
    }

    @Override
    public int updateTopic(Topic topic) {
        return topicDao.updateTopic(topic);
    }

    @Override
    public RecordLike findRecordLike(Integer id, Integer userId) {
        return topicDao.findRecordLike(id,userId);
    }

    @Override
    public int addRecordLike(RecordLike recordLike) {
        return topicDao.addRecordLikeNum(recordLike);
    }

    @Override
    public int updateLikeNum(Integer id) {
        return topicDao.updateLikeNum(id);
    }

    @Override
    public RecordDisLike findRecordDisLike(Integer id, Integer userId) {
        return topicDao.findRecordDisLike(id,userId);
    }

    @Override
    public int addRecordDisLike(RecordDisLike recordDisLike) {
        return topicDao.addRecordDisLike(recordDisLike);
    }

    @Override
    public int updateDisLikeNum(Integer id) {
        return topicDao.updateDisLikeNum(id);
    }
}
