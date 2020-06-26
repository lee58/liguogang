package com.itor.controller;

import com.itor.entity.UserEntity;
import com.itor.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    private static final String USERLIST = "user/userList";

    @Autowired
    UserService userService;

    @RequestMapping("/userList")
    public String userList(Map<String, Object> map) {
        List<UserEntity> userList = userService.findUserList();
        map.put("userList", userList);
        return USERLIST;
    }

}
