package pers.wmx.learningcenter.dao;

import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.Activity;
import pers.wmx.learningcenter.domain.User;

import java.util.List;

@Mapper
public interface ActivityDao {

    @Insert("insert into activity(user_id,topic,description,create_time,start_time,address,cost,total_number) " +
            "values(#{userId},#{topic},#{description},#{createTime},#{startTime},#{address},#{cost},#{totalNumber})")
    int add(Activity activity);

    @Select({"<script>",
            "SELECT * FROM activity",
            "WHERE 1=1",
            "<when test='userId!=null'>",
            "AND user_id = #{userId}",
            "</when>",
            "ORDER BY create_time desc",
            "</script>"})
    List<Activity> findActivityList(@Param(value = "userId") Integer userId);

    @Delete("delete from activity where id = #{curId}")
    int deleteById(@Param(value = "curId") int curId);

    @Update("update activity set topic=#{topic},description=#{description},start_time=#{startTime}," +
            "address=#{address},cost=#{cost},total_number=#{totalNumber} " +
            "where id=#{id}")
    int updateActivity(Activity activity);

    @Select("select * from  activity where id = #{id}")
    Activity findById(@Param(value = "id") Integer id);

    @Insert("insert into user_activity(activity_id,user_id) values(#{id},#{userId})")
    int takeActivity(@Param(value = "id")Integer id, @Param(value = "userId")Integer userId);

    @Select("select user_id from user_activity where activity_id = #{id}")
    List<Integer> findUsersById(@Param(value = "id")Integer id);
}
