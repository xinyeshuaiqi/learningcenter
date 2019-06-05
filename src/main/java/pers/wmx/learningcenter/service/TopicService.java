package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.RecordDisLike;
import pers.wmx.learningcenter.domain.RecordLike;
import pers.wmx.learningcenter.domain.Topic;

import java.util.List;

public interface TopicService {
    int add(Topic topic);

    List<Topic> findTopicList(Integer userId);

    int deleteById(Integer id);

    Topic findById(Integer id);

    int updateTopic(Topic topic);

    RecordLike findRecordLike(Integer id, Integer userId);

    int addRecordLike(RecordLike recordLike);

    int updateLikeNum(Integer id);

    RecordDisLike findRecordDisLike(Integer id, Integer userId);

    int addRecordDisLike(RecordDisLike recordDisLike);

    int updateDisLikeNum(Integer id);
}
