package com.itor.mapper;

import com.itor.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MenuMapper {
    @Select("select method_path as methodPath, name from t_memu where parent_id != 0 and name LIKE '%${name}%';")
    List<Menu> queryMenuByName(@Param("name") String key);
}
