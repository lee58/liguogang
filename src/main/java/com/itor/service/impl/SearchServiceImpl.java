package com.itor.service.impl;

import com.itor.entity.Menu;
import com.itor.mapper.MenuMapper;
import com.itor.service.SearchService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public String search(String key) {
        List<Menu> menus = menuMapper.queryMenuByName(key);
        if (menus == null || menus.size() == 0) return "";
        StringBuffer sb = new StringBuffer();
        sb.append("<ul>");
        menus.forEach(menu -> sb.append("<li methodPath='"+menu.getMethodPath()+"'>")
                .append(menu.getName())
                .append("</li>"));
        sb.append("</ul>");
        return sb.toString();
    }
}
