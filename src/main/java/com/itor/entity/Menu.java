package com.itor.entity;

import lombok.Data;

@Data
public class Menu {

    private Integer id;
    private Integer parentId;
    private String name;
    private String methodPath;
    private String desc;

    public Menu() {}

    public Menu(Integer parentId, String name, String methodPath, String desc) {
        this.parentId = parentId;
        this.name = name;
        this.methodPath = methodPath;
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", methodPath='" + methodPath + '\'' +
                ", desc='" + desc + '\'' +
                '}';
    }
}
