package com.itor.entity;

import lombok.Data;

@Data
public class Menu {

    private Integer id;
    private Integer parentId;
    private String name;
    private String methodPath;
    private String desc;

}
