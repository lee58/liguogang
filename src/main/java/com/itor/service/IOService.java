package com.itor.service;


import java.util.List;

public interface IOService {

    List<String> takeDir2BaseDir(String directoryList, String suffixes, String baseDirectory);
}
