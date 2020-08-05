package com.itcast.test;

import com.itcast.dao.UserDao;
import com.itcast.dao.impl.UserDaoimpl;
import com.itcast.pojo.User;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class UserDaoimplTest {
    UserDao userDao = new UserDaoimpl();

    @Test
    public void updatePhoto() {
        System.out.println(userDao.updatePhoto("a.jpg", 1));
    }

    @Test
    public void queryUsers() {
        List<User> users = userDao.queryUsers();
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void queryUserByUsername() {
        System.out.println(userDao.queryUserByUsername("admin"));
    }

    @Test
    public void changePassword() {
        System.out.println(userDao.updatePassword("wh1234", 8));
    }


    @Test
    public void updateMess() {
        System.out.println(userDao.updateMessage("2595797","wh2595797@qq.com","哈哈哈哈",8));
    }
}