package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author 大都督
 * @create 2020/5/12
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    private static final String INDEX = "index/main";

    /**
     * 跳转到主页
     * @return
     */
    @GetMapping("/main")
    public String main(HttpSession session, Map<String, String> map) {
        Object userId = session.getAttribute("userId");
        map.put("email", (String) session.getAttribute("email"));
        return INDEX;
    }
}
