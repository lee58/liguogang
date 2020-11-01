package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * get post 请求效果测试
 */
@Controller
@RequestMapping("/GetPost")
public class GetPostController {

    // get post请求页
    private static final String GET_POST_PAGE = "getPost/getPostPage";

    @RequestMapping("/toGetPostPage")
    public String getMethod(String param, String param2) {
        return GET_POST_PAGE;
    }

    @RequestMapping("/doRequest")
    @ResponseBody
    public String doRequest(String param, String param2) {
        return "param = " + param + ", param2 = " + param2;
    }

}
