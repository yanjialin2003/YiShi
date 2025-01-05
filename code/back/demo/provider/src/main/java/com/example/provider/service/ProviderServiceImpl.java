package com.example.provider.service;

import com.YiShi.UserService;
import org.apache.dubbo.config.annotation.DubboService;

/**
 * @author 晏嘉琳
 */
@DubboService(version = "1.0.0")
public class ProviderServiceImpl implements UserService {

    @Override
    public String getUser() {
        return "yjl";
    }
}
