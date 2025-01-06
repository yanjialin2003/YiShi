package com.example.consumer.controller;

import com.example.consumer.service.Consumer;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 晏嘉琳
 */
@RestController
public class ConsumerController {

    @Resource
    private Consumer consumer;

    @GetMapping("/consumer")
    public String getConsumer() {
        return consumer.getConsumer();
    }
}
