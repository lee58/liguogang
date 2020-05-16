package com.itor.controller;

import com.itor.entity.UserEntity;
import com.itor.service.LoginService;
import com.itor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Controller
public class LoginController {

    private static final String LOGIN = "login/login";
    @Autowired
    UserService userService;
    @Autowired
    LoginService loginService;

    @GetMapping("/")
    public String login() {
        return LOGIN;
    }

    @PostMapping("/login")
    @ResponseBody
    public String postLogin(UserEntity user, HttpSession session) {
        return loginService.postLogin(user, session);
    }

    /**
     * 判断邮箱是否已经注册
     * @param email
     * @return
     */
    @PostMapping("/isExistUser")
    @ResponseBody
    public Boolean isExistUser(String email) {
        return !userService.isNotExistUser(email);
    }
}
