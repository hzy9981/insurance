package com.qing.insurance.service.Impl;

import com.qing.insurance.dao.UserMapper;
import com.qing.insurance.pojo.User;
import com.qing.insurance.service.UserService;
import com.qing.insurance.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /*
     * 检验用户登录业务
     *
     */
    @Override
    public User checkLogin(String username, String password) {
        User user = userMapper.findByUsername(username);
        String md5Password = MD5Util.MD5EncodeUtf8(password);
        if (user != null && user.getPassword().equals(md5Password)) {
            return user;
        }
        return null;
    }


    public User findUser(String username) {
        User user = userMapper.findByUsername(username);
        if (user != null ) {
            return user;
        }
        return null;
    }

    public User findTel(String tel) {
        User user = userMapper.findByTel(tel);
        if (user != null ) {
            return user;
        }
        return null;
    }

    public User findEmail(String email) {
        User user = userMapper.findByEmail(email);
        if (user != null ) {
            return user;
        }
        return null;
    }

    public int checkValid(String username, String tel) {

        User user = userMapper.findByUsername(username);
        if (user != null) {
            return 1;
        }
        else{
            user = userMapper.findByTel(tel);
            if (user != null) {
                return 2;
            }
            else {
                return 3;
            }
        }

    }

    public void register(User user) {
        try {
            user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
            userMapper.insert(user);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void updatePassword(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    public User forgetPassword(String tel) {
        User user =  userMapper.findByTel(tel);
        return user;
    }

}
