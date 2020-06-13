package com.itor.service.impl;

import com.itor.service.SearchService;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceImpl implements SearchService {
    @Override
    public String search(String key) {
        String ul = "<ul><li>车 险</li><li>保 险</li></ul>";
        return ul;
    }
}
