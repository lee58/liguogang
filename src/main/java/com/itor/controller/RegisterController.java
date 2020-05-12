package com.itor.controller;

import com.itor.entity.UserEntity;
import com.itor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
    private static final String REGISTER = "register/register";
    @Autowired
    private UserService userService;

    /**
     * GET请求跳转到注册页
     * @return
     */
    @GetMapping("/register")
    public String getRegister() {
        return REGISTER;
    }

    /**
     * POST请求注册表单
     * @param userEntity
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public Integer postRegister(UserEntity userEntity) {
        return userService.postRegister(userEntity);
    }

    /**
     * 验证该邮箱是否已经注册
     * @param email
     * @return
     */
    @PostMapping("/isNotExistUser")
    @ResponseBody
    public Boolean isNotExistUser(String email) {
        return userService.isNotExistUser(email);
    }
}
