package com.itor.service;

import com.itor.entity.UserEntity;

import javax.servlet.http.HttpSession;

/**
 * @author 大都督
 * @create 2020/5/12
 */
public interface LoginService {
    String postLogin(UserEntity user, HttpSession session);
}
