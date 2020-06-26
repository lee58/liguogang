package com.itor.service;

import com.itor.entity.UserEntity;

import java.util.List;

/**
 * @author 大都督
 * @create 2020/5/10
 */
public interface UserService {
    Boolean isNotExistUser(String email);

    Integer postRegister(UserEntity userEntity);

    List<UserEntity> findUserList();
}
