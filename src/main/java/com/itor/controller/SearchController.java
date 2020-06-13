package com.itor.controller;

import com.itor.service.SearchService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
    @Autowired
    SearchService searchService;

    @PostMapping("/search")
    @ResponseBody
    public String search(@Param("key") String key) {
        return searchService.search(key);
    }
}
