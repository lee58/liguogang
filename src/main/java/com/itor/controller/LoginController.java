package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Controller
public class LoginController {

    private static final String LOGIN = "login/login";

    @GetMapping("/login")
    public String login() {
        return LOGIN;
    }
}
