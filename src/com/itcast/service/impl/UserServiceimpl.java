package com.itcast.service.impl;

import com.itcast.dao.UserDao;
import com.itcast.dao.impl.UserDaoimpl;
import com.itcast.pojo.Page;
import com.itcast.pojo.User;
import com.itcast.service.UserService;

import java.util.List;

public class UserServiceimpl implements UserService {

    UserDao userDao = new UserDaoimpl();

    @Override
    public void registUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {
        if (userDao.queryUserByUsername(username) == null) {
            return false;
        }
        return true;
    }

    @Override
    public void updatePhoto(String filename, Integer id) {
        userDao.updatePhoto(filename, id);

    }

    @Override
    public List<User> queryUsers() {
        return userDao.queryUsers();
    }

    @Override
    public User queryUserByName(String username) {
        return userDao.queryUserByUsername(username);
    }


    @Override
    public Page<User> page(int pageNo, int pageSize) {
        Page<User> page = new Page<User>();

        //设置每页的数量
        page.setPageSize(pageSize);
        //求总记录数
        Integer pageTotalCount = userDao.queryForPageTotalCount();
        //设置总记录数
        page.setPageTotalCount(pageTotalCount);
        //求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal++;
        }
        //设置总页码
        page.setPageTotal(pageTotal);


        //设置当前页码
        page.setPageNo(pageNo);

        //求当前页数据开始的索引
        int begin = (page.getPageNo() - 1) * pageSize;
        //求当前页数据
        List<User> items = userDao.queryForPageItems(begin, pageSize);
        //设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public void updatePassword(String newPassword,Integer id) {
        userDao.updatePassword(newPassword,id);
    }

    @Override
    public void updateMessage(String newPhone, String newEmail, String newMess, Integer id) {
        userDao.updateMessage(newPhone,  newEmail,  newMess,  id);
    }
}
