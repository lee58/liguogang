package com.itor;

import com.itor.entity.UserEntity;
import com.itor.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.ConcurrentHashMap;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MybatisTest {

    @Autowired
    UserMapper userMapper;

    @Test
    public void addUserEntity() {
//        int i = userMapper.addUserEntity(new UserEntity("大都督", "952051088@qq.com", "111111"));
//        System.out.println("addUserEntity:" + i);
    }

    @Test
    public void testConcurrentHashMap() {
        ConcurrentHashMap<String, String> concurrentHashMap = new ConcurrentHashMap<>();
        concurrentHashMap.put("a", "aVal");
        concurrentHashMap.put("97", "97Val");
        concurrentHashMap.get("a");
    }

}
