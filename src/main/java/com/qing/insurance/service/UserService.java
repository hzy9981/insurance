package com.qing.insurance.service;

import com.qing.insurance.pojo.User;

public interface UserService {
    //检验用户登录
    User checkLogin(String username, String password);

    void register(User user);

    void updatePassword(User user);

    int checkValid(String username, String tel);

    User findUser(String username);

    User findTel(String tel);

    User findEmail(String email);

    User forgetPassword(String tel);

}
