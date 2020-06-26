package com.itor.service.impl;

import com.itor.common.util.ZipUtil;
import com.itor.service.IOService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class IOServiceImpl implements IOService {

    @Override
    public List<String> takeDir2BaseDir(String directoryList, String suffixes, String baseDirectory) {
        String[] split = directoryList.split(",");
        String[] sufixArr = suffixes.split(",");
        ZipUtil.takeDir2BaseDir(Arrays.asList(split), baseDirectory, Arrays.asList(sufixArr));
        return null;
    }
}
