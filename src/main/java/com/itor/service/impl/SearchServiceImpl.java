package com.itor.service.impl;

import com.itor.entity.Menu;
import com.itor.mapper.MenuMapper;
import com.itor.service.SearchService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class SearchServiceImpl implements SearchService {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public String search(String key) {
        String searchSql = "select name, method_path as MethodPath from t_memu where LOCATE('"+key+"',description) > 0 and parent_id > 0 union";
        StringBuilder sql = new StringBuilder();
        int keyLength = key.length();
        if (keyLength > 1) {
            for (int i = keyLength - 1; i > 0 ; i --) {
                sql.append(" select name, method_path as MethodPath")
                        .append(" from t_memu")
                        .append(" where LOCATE('"+key.substring(0, i)+"',description) > 0 and parent_id > 0")
                        .append(" union")
                        .append(" select name, method_path as MethodPath")
                        .append(" from t_memu")
                        .append(" where LOCATE('"+key.substring(keyLength - i, keyLength)+"',description) > 0 and parent_id > 0")
                        .append(" union");
            }
            searchSql = searchSql.concat(sql.toString());
        }
        searchSql = searchSql.substring(0, searchSql.lastIndexOf("union"));
        log.info("search sql is {}", searchSql);
        List<Menu> menus = jdbcTemplate.query(searchSql, new BeanPropertyRowMapper<Menu>(Menu.class)) ;
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
