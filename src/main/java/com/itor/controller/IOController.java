package com.itor.controller;

import com.itor.service.IOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IOController {

    private static final String COPY_FILE = "IO/copyFile";

    @Autowired
    IOService ioService;

    @RequestMapping("/copyFile")
    public String copyFile() {
        return COPY_FILE;
    }

    @RequestMapping("/takeDir2BaseDir")
    public List<String> takeDir2BaseDir(String directoryList, String Suffixes, String baseDirectory) {
        return ioService.takeDir2BaseDir(directoryList, Suffixes, baseDirectory);
    }
    
}
