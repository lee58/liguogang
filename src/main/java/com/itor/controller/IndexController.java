package com.itor.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author 大都督
 * @create 2020/5/12
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    // 主页
    private static final String INDEX = "index/main";
    // 登录页
    private static final String LOGIN = "login/login";
    // 代理模式页
    private static final String PROXY_PATTERN = "java/designPattern/proxyPattern";

    /**
     * 跳转到主页
     * @return
     */
    @GetMapping("/main")
    public String main(HttpSession session, Map<String, String> map) {
        Object userId = session.getAttribute("userId");
        String name = (String) session.getAttribute("name");
        if (StringUtils.isEmpty(name)) {
            return LOGIN;
        }
        map.put("name", name);
        return INDEX;
    }

    /**
     * 返回li标签的html页面
     * @return
     */
    @GetMapping("/getHtmlByValue")
    public String getHtmlByValue(String li) {
        return PROXY_PATTERN;
    }

    @GetMapping("/getText")
    @ResponseBody
    public String getText() {
        return "this is text response";
    }

    @GetMapping("/getJsonText")
    @ResponseBody
    public String getJsonText() {

        return "[{'attr': 'val'}]";
    }
}
