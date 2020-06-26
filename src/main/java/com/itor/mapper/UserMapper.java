package com.itor.mapper;

import com.itor.entity.UserEntity;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Mapper
public interface UserMapper {

    @Insert("insert into user(name, email, password) values(#{name}, #{email}, #{password})")
    public int addUserEntity(UserEntity userEntity);

    @Select("select * from user where email = #{email}")
    UserEntity findUserByEmail(String email);

    @Select("select * from user where email = #{email} and password = #{password}")
    UserEntity findUserByEmailAndPassword(UserEntity user);

    @Select("select * from user")
    List<UserEntity> findAll();
}
