package com.ys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.ys.model.Max;
//使用@param注解
public interface IMaxDao {
	  public List<Max> queryDate(@Param("startTime")String startTime,@Param("endTime")String endTime);
	  public List<Max> queryDate(String startTime);
}
