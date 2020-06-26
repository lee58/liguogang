package com.itor.common.util;


import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 文件处理工具
 */
@Slf4j
public class FileUtil {
    public static void main(String[] args) throws Exception{
        String directoryPath = "C:\\Users\\95205\\Desktop\\文件";
        File directory = new File(directoryPath);
        if (!directory.exists() || !directory.isDirectory()) {
            log.info("{}不存在或不是目录", directory.getName());
            return;
        }
        List<File> fileList = getFiles(directory, ".doc");
        fileList.parallelStream().forEach(file -> {
            log.info("file is {}", file.getName());
        });

    }

    private static List<File> getFiles(File directory, String suffix) {
        List<File> files = new ArrayList<>();
        File[] listFiles = directory.listFiles();
        Arrays.stream(listFiles).forEach(file -> {
            if (file.isFile() && file.getName().endsWith(suffix)) {
                files.add(file);
            }else if (file.isDirectory()) {
                files.addAll(getFiles(file, suffix));
            }
        });
        return files;
    }


}
