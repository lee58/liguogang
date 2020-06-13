package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToolsController {

    private static final String CALENDAR = "tools/calendar";

    @RequestMapping("/calendar")
    public String calendar() {
        return CALENDAR;
    }
}
