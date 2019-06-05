package pers.wmx.learningcenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.UserDao;
import pers.wmx.learningcenter.domain.User;
import pers.wmx.learningcenter.service.UserService;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-11 18:07
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Autowired
    BCryptPasswordEncoder encoder;

    @Override
    public List<User> findUserByNumber(String number) {
        return userDao.findUserByNumber(number);
    }

    @Override
    public int registry(User user) {

        String password = encoder.encode(user.getPassword());
        user.setPassword(password);

        return userDao.add(user);
    }

    @Override
    public User findByUser(User user) {
        List<User> users = findUserByNumber(user.getNumber());

        User temp = null;
        String realPassword = "";
        if(users !=null && users.size()>0) {
            temp = users.get(0);
            realPassword = temp.getPassword();
        }

        boolean matches = encoder.matches(user.getPassword(), realPassword);
        if(matches){
            return temp;
        }

        return null;

    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public String findNicknameById(Integer userId) {
        return userDao.findNicknameById(userId);
    }

    @Override
    public String findPhoneNumberById(Integer userId) {
        return userDao.findPhoneNumberById(userId);
    }

    @Override
    public List<User> findUserList() {
        return userDao.findUserList();
    }

    @Override
    public int deleteById(Integer id) {
        return userDao.deleteById(id);
    }

    @Override
    public int banUser(Integer id) {
        return userDao.banUser(id);
    }

    @Override
    public int activeUser(Integer id) {
        return userDao.activeUser(id);
    }

    @Override
    public int updatePas(Integer id, String password) {

        String realPassword = encoder.encode(password);
        return userDao.updatePas(id,realPassword);
    }

}
