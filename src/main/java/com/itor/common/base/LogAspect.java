package com.itor.common.base;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * @author 大都督
 * @create 2020/5/10
 */
@Aspect // 定义切面类
@Component
@Slf4j
public class LogAspect {
    private JSONObject jsonObject = new JSONObject();

    // 定义切点 表示拦截controller包下的所有类中的所有方法
    @Pointcut("execution(public * com.itor.controller.*.*(..))")
    private void pointcut() {
    }

    // 请求method前打印内容
    @Before(value = "pointcut()")
    public void before(JoinPoint joinPoint) {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        log.info("--------------begin----------------");
        try {
            // 打印请求内容
            log.info("url: {}", request.getRequestURL().toString());
            log.info("httpMethod: {}", request.getMethod());
            log.info("method: {}", joinPoint.getSignature());
            log.info("args: {}", Arrays.toString(joinPoint.getArgs()));
        } catch (Exception e) {
            log.error("###LogAspect.class before() ### ERROR:", e);
        }
    }

    // 在方法执行完结后打印返回内容
    @AfterReturning(returning = "o", pointcut = "pointcut()")
    public void after(Object o) {
        try {
            log.info("Response: {}", jsonObject.toJSONString(o));
        } catch (Exception e) {
            log.error("###LogAspect.class after() ### ERROR:", e);
        }
        log.info("--------------end----------------");
    }
}
