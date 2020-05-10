package com.itor.mapper;

import com.itor.entity.UserEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Mapper
public interface UserMapper {

    @Insert("insert into user(name, email) values(#{name}, #{email})")
    public int addUserEntity(UserEntity userEntity);
}
