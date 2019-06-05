package pers.wmx.learningcenter.domain;

/**
 * @author: wang ming xin
 * @create: 2019-05-15 23:02
 */
public class RecordDisLike {
    Integer id;

    Integer topicId;

    Integer userId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
