package pers.wmx.learningcenter.dao;


import org.apache.ibatis.annotations.*;
import pers.wmx.learningcenter.domain.User;

import java.util.List;

@Mapper
public interface UserDao {

    @Select("select * from  USER where number = #{number}")
    public List<User> findUserByNumber(@Param(value = "number") String number);

    @Select("select * from  USER")
    public List<User> findUserList();

    @Insert("insert into USER(number,NAME,nickname,classes,phone_number,sex,signature,PASSWORD,TYPE) " +
            "values(#{number},#{name},#{nickname},#{classes},#{phoneNumber},#{sex},#{signature},#{password},#{type})")
    int add(User user);

    @Update("update USER set number=#{number},NAME=#{name},nickname=#{nickname}," +
            "classes=#{classes},phone_number=#{phoneNumber},sex=#{sex}," +
            "signature=#{signature} " +
            "where id=#{id}")
    int updateUser(User user);

    @Select("select nickname from  USER where id = #{userId}")
    String findNicknameById(@Param(value = "userId")Integer userId);

    @Select("select phone_number from  USER where id = #{userId}")
    String findPhoneNumberById(@Param(value = "userId")Integer userId);

    @Delete("delete from USER where id = #{id}")
    int deleteById(@Param(value = "id")Integer id);

    @Update("update USER set satus=1 " +
            "where id=#{id}")
    int banUser(@Param(value = "id")Integer id);

    @Update("update USER set satus=0 " +
            "where id=#{id}")
    int activeUser(@Param(value = "id")Integer id);

    @Update("update USER set password= #{password} " +
            "where id=#{id}")
    int updatePas(@Param(value = "id")Integer id, @Param(value = "password")String password);
}
