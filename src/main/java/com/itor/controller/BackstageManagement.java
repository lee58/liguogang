package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackstageManagement {

    private static final String BACKSTAGE_MANAGEMENT = "backstage/backstageManagement";

    @RequestMapping("/backstageManagement")
    public String backstageManagement() {
        return BACKSTAGE_MANAGEMENT;
    }
}
