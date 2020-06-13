package com.itor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkEasy {

    private static final String VEHICLEINSURANCE = "workEasy/vehicleInsurance";

    /**
     * 车险
     * @return
     */
    @RequestMapping("/vehicleInsurance")
    public String vehicleInsurance() {
        return VEHICLEINSURANCE;
    }
}
