package pers.wmx.learningcenter.dao;

import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.RecordDisLike;
import pers.wmx.learningcenter.domain.RecordLike;
import pers.wmx.learningcenter.domain.Topic;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-05-14 18:56
 */

@Mapper
public interface TopicDao {

    @Insert("insert into topic(user_id,title,content,create_time) " +
            "values(#{userId},#{title},#{content},#{createTime})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int add(Topic topic);

    @Select({"<script>",
            "SELECT * FROM topic",
            "WHERE 1=1",
            "<when test='userId!=null'>",
            "AND user_id = #{userId}",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Topic> findTopicList(@Param(value = "userId")Integer userId);

    @Delete("delete from topic where id = #{id}")
    int deleteById(@Param(value = "id")Integer id);

    @Select("select * from  topic where id = #{id}")
    Topic findById(@Param(value = "id")Integer id);

    @Update("update topic set title=#{title},content=#{content},update_time=#{updateTime} " +
            "where id=#{id}")
    int updateTopic(Topic topic);

    @Select("select * from  recordLike where topic_id = #{topicId} and user_id = #{userId}")
    RecordLike findRecordLike(@Param(value = "topicId")Integer id, @Param(value = "userId")Integer userId);

    @Insert("insert into recordLike(user_id,topic_id) " +
            "values(#{userId},#{topicId})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int addRecordLikeNum(RecordLike recordLike);

    @Update("update topic set like_num=like_num+1 " +
            "where id=#{id}")
    int updateLikeNum(@Param(value = "id")Integer id);

    @Select("select * from  recordDisLike where topic_id = #{topicId} and user_id = #{userId}")
    RecordDisLike findRecordDisLike(@Param(value = "topicId")Integer id, @Param(value = "userId")Integer userId);

    @Insert("insert into recordDisLike(user_id,topic_id) " +
            "values(#{userId},#{topicId})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int addRecordDisLike(RecordDisLike recordDisLike);

    @Update("update topic set dislike_num=dislike_num+1 " +
            "where id=#{id}")
    int updateDisLikeNum(@Param(value = "id")Integer id);
}
