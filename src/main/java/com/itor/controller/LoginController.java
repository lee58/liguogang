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

    @GetMapping("/login")
    @ResponseBody
    public String login() {
        return "login";
    }
}
