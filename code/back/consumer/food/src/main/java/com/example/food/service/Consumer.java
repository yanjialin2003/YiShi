package com.example.food.service;

import com.YiShi.UserService;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;

/**
 * @author 晏嘉琳
 */
@Component
public class Consumer {
    @DubboReference(version = "1.0.0")
    private UserService userService;

    public String getConsumer() {
        return userService.getUser();
    }
}
