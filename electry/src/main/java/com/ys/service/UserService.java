package com.ys.service;

import org.springframework.stereotype.Service;

/**
 * 用户业务接口
 * @author:bobo
 *
 */

public interface UserService {
    
     public boolean login(String username,String password);
     public boolean Register(String username,String password);
   
}