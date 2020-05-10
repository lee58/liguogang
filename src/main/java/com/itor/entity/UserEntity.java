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

    public UserEntity() {
    }

    public UserEntity(String name, String email) {
        this.name = name;
        this.email = email;
    }
}
