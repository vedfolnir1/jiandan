package cn.ved.ssmblog.service.impl;

import cn.ved.ssmblog.dao.UserDao;
import cn.ved.ssmblog.domain.User;
import cn.ved.ssmblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.PrivateKey;

@Service(value = "userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public void addUser(User user) {
        userDao.addtUser(user);
    }

    @Override
    public User findUserByemail(String email) {
        return userDao.findByemail(email);
    }

    @Override
    public User findUserByName(String username) {
        return userDao.findByName(username);
    }
}
