package com.itcast.dao.impl;

import com.itcast.dao.UserDao;
import com.itcast.pojo.User;

import java.util.List;

public class UserDaoimpl extends BaseDao implements UserDao {

    @Override
    public User queryUserByUsername(String username) {
        String sql = "select * from member where username = ?";
        return queryForOne(User.class,sql,username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "select * from member where username = ? and password = ?";
        return queryForOne(User.class,sql,username,password);
    }

    @Override
    public int saveUser(User user) {
        String sql = "insert into member(`username`,`password`,`phone`,`email`,`message`,`pic`) values(?,?,?,?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getPhone(),user.getEmail(),user.getMessage(),user.getPic());
    }

    @Override
    public int updatePhoto(String filename ,Integer id) {
        String sql = "update member set pic = ? where id = ?";
        return update(sql,filename,id);
    }

    @Override
    public List<User> queryUsers() {
        String sql = "select* from member";
        return queryForList(User.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from member";

        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<User> queryForPageItems(int begin, int pageSize) {
        String sql = "select* from member limit ?,?";
        return queryForList(User.class,sql,begin,pageSize);
    }

    @Override
    public int updatePassword(String newPassword,Integer id) {
        String sql = "update member set password = ? where id = ?";
        return update(sql,newPassword,id);
    }

    @Override
    public int updateMessage(String newPhone, String newEmail, String newMess, Integer id) {
        String sql = "update member set phone = ?,email = ?,message = ? where id = ?";
        return update(sql,newPhone,newEmail,newMess,id);
    }

}
