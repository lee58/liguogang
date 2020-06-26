package com.itor.common.util;


import org.apache.commons.io.FilenameUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;


public class ZipUtil {

//    public static void main(String[] args) throws Exception {
//        String baseDirectory = "C:\\Users\\95205\\Desktop\\doc";
//        List<String> decompressSuffs = Arrays.asList("doc", "docx");
//        List<String> directoryList = Arrays.asList("G:\\蚂蚁课堂\\5期", "G:\\蚂蚁课堂\\6期");
//        takeDir2BaseDir(directoryList, baseDirectory, decompressSuffs);
//    }

    public static boolean takeDir2BaseDir(List<String> directoryList, String baseDirectory, List<String> decompressSuffs) {
        directoryList.stream().forEach(directory -> {
            File dir = new File(directory);
            File[] files = dir.listFiles();
            Arrays.stream(files).map(file -> new File(directory, file.getName())).forEach(f -> {
                try {
                    decompressToDirectory(f, baseDirectory, decompressSuffs);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
        });
        return true;
    }

    static int count = 0;


    public static Boolean decompressToDirectory(File compressFile, String baseDirectory, List<String> decompressSuffs) throws Exception {
        //验证压缩文件
        boolean isFile = compressFile.isFile();
        if (!isFile){
            System.out.println(String.format("compressFile: %s 非文件格式！",compressFile.getName()));
            return false;
        }
        String compressFileSuff = FilenameUtils.getExtension(compressFile.getName()).toLowerCase();
        if (!compressFileSuff.equals("zip")){
            System.out.println(String.format("[%s]文件非zip类型的压缩文件！",compressFile.getName()));
            return false;
        }

        //region 解压缩文件(zip)
        ZipFile zip = new ZipFile(new File(compressFile.getAbsolutePath()), Charset.forName("GBK"));//解决中文文件夹乱码
        for (Enumeration<? extends ZipEntry> entries = zip.entries(); entries.hasMoreElements();){
            ZipEntry entry = entries.nextElement();
            String zipEntryName = entry.getName();
            //过滤非指定后缀文件
            String suff = FilenameUtils.getExtension(zipEntryName).toLowerCase();//FileUtil.getFileSuffix(zipEntryName).toLowerCase();
            if (decompressSuffs != null && decompressSuffs.size() > 0){
                if (decompressSuffs.stream().filter(s->s.equals(suff)).collect(Collectors.toList()).size() <= 0){
                    continue;
                }
            }
            //创建解压目录(如果复制的代码，这里会报错，没有StrUtil，这里就是创建了一个目录来存储提取的文件，你可以换其他方式来创建目录)
            File group = new File(baseDirectory);
            if(!group.exists()){
                group.mkdirs();
            }
            File zipEntryPath = new File(zipEntryName);
            String baseName = FilenameUtils.getBaseName(zipEntryName);
            //解压文件到目录
            String outPath = baseDirectory
                    .concat(File.separator)
                    .concat(String.valueOf(++count))
                    .concat("-")
                    .concat(baseName)
                    .concat(".")
                    .concat(suff)
                    .replaceAll("\\*", "/");
            System.out.println("outPath: " + outPath);
            InputStream in = zip.getInputStream(entry);
            FileOutputStream out = new FileOutputStream(outPath);
            byte[] buf1 = new byte[1024];
            int len;
            while ((len = in.read(buf1)) > 0) {
                out.write(buf1, 0, len);
            }
            in.close();
            out.close();
        }
       return true;
    }


}
