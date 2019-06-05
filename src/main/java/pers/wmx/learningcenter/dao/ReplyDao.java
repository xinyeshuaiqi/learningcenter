package pers.wmx.learningcenter.dao;

import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.Reply;

import java.util.List;

@Mapper
public interface ReplyDao {

    @Insert("insert into reply(user_id,content,topic_id,parent_id,create_time) " +
            "values(#{userId},#{content},#{topicId},#{parentId},#{createTime})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")   //插入成功后返回id
    int add(Reply reply);

    @Select("select * from  reply where topic_id = #{topicId} order by create_time desc")
    List<Reply> findReplyList(@Param(value = "topicId")Integer id);

    @Select("select * from  reply where parent_id = #{parentId} order by create_time desc")
    List<Reply> findChildren(@Param(value = "parentId")Integer id);
}
