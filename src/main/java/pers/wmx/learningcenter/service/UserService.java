package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.User;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-11 18:07
 */
public interface UserService {
    public List<User> findUserByNumber(String number);

    int registry(User user);

    User findByUser(User user);

    int updateUser(User user);

    String findNicknameById(Integer userId);

    String findPhoneNumberById(Integer userId);

    List<User> findUserList();

    int deleteById(Integer id);

    int banUser(Integer id);

    int activeUser(Integer id);

    int updatePas(Integer id, String password);
}
