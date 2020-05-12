package com.itor.service.impl;

import com.itor.entity.UserEntity;
import com.itor.mapper.UserMapper;
import com.itor.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 大都督
 * @create 2020/5/12
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    UserMapper userMapper;

    @Override
    public String postLogin(UserEntity user) {
        UserEntity userEntity = userMapper.findUserByEmailAndPassword(user);
        if (userEntity == null) {
            return "用户名或密码错误";
        }
        return "success";
    }
}
