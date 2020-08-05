package com.itcast.service;

import com.itcast.pojo.Page;
import com.itcast.pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 注册用户
     * @param user
     */
    public void registUser(User user);

    /**
     * 登录
     * @param user
     * @return 如果返回null，说明登录失败，返回有值，是登录成功
     */
    public User login(User user);

    /**
     * 检查 用户名是否可用
     * @param username
     * @return 返回true表示用户名已存在，返回false表示用户名可用
     */
    public boolean existsUsername(String username);

    public void updatePhoto(String filename,Integer id);

    public List<User> queryUsers();

    public User queryUserByName(String username);

    Page<User> page(int pageNo, int pageSize) ;

     public void updatePassword(String newPassword,Integer id);

    public void updateMessage(String newPhone, String newEmail, String newMess, Integer id);
}
