package com.itor.controller;

import com.itor.service.SearchService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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

}
