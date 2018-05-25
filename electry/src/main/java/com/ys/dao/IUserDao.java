package com.ys.dao;
/**
 * @author liushaobo
 */

import org.apache.ibatis.annotations.Param;

import com.ys.model.*;


public interface IUserDao {
    //这里以接口形式定义了数据库操作方法,我们只需
    // 在Mybatis映射文件中对其进行映射就可以直接使用

    public User queryUserByName(String username);
    public void insertUser(@Param("username")String username,@Param("password")String password);
    
  
}