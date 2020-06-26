package com.itor.service.impl;

import com.itor.entity.UserEntity;
import com.itor.mapper.UserMapper;
import com.itor.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public Boolean isNotExistUser(String email) {
        UserEntity userEntity = userMapper.findUserByEmail(email);
        if (userEntity == null) {
            return true;
        }
        return false;
    }

    @Override
    public Integer postRegister(UserEntity userEntity) {
        return userMapper.addUserEntity(userEntity);
    }

    @Override
    public List<UserEntity> findUserList() {
        List<UserEntity> userEntities = userMapper.findAll();
        return userEntities;
    }
}
