package com.itor;

import java.util.ArrayList;

/**
 * ArrayList 扩容和缩容
 * 存放元素：有序
 * 线程是否安全：不安全
 * get add 方法
 * 数据结构：基于数组实现
 * 时间复杂度：
 */
public class ListTest {
    public static void main(String[] args) {
        ArrayList<Object> arrayList = new ArrayList<>();
        for (int i = 0; i < arrayList.size(); i ++) {
            arrayList.add("liguogang");
        }
        int index = 0;
        Object o = arrayList.get(index);
    }
}
