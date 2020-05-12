package com.itor.entity;

import lombok.Data;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Data
public class UserEntity {

    private Long id;
    private String name;
    private String email;
    private String password;

    public UserEntity() {
    }

    public UserEntity(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
