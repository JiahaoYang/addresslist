package qsh.service;

import org.springframework.stereotype.Service;
import qsh.dao.UserDAO;
import qsh.entity.User;
import qsh.util.MD5Util;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {

    @Resource
    UserDAO userDAO;

    public User getById(int userId) {
        return userDAO.getById(userId);
    }

    public User getByName(String username) {
        return userDAO.getByName(username);
    }

    public int addUser(User user) {
        String password = user.getPassword();
        user.setPassword(MD5Util.MD5(password));
        return userDAO.addUser(user);
    }

    public int updateUser(User user) {
        return userDAO.updateUser(user);
    }

    public boolean isExist(String username) {
        return getByName(username) != null;
    }

    public User login(String username, String password) {
        User user = userDAO.getByName(username);
        if (user != null && user.getPassword().equals(MD5Util.MD5(password)))
            return user;
        return null;
    }

    public int updatePassword(String username, String password) {
        return userDAO.updatePassword(username, MD5Util.MD5(password));
    }

}
