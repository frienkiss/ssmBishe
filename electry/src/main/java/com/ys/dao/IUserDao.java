package com.ys.dao;


import com.ys.model.*;


public interface IUserDao {
    //这里以接口形式定义了数据库操作方法,我们只需
    // 在Mybatis映射文件中对其进行映射就可以直接使用

    public User queryUserByName(String username);
  
}