package com.ys.dao;
/**
 * @author liushaobo
 */
import java.util.List;

import org.apache.ibatis.annotations.Param;



import com.ys.model.*;
//使用@param注解
public interface IMaxDao {
	  public List<Max> queryDate(@Param("startTime")String startTime,@Param("endTime")String endTime);
	  public List<Max> queryDate2(String startTime);
	  public List<Max> queryDate4(String selectDate);//碳分析
	  public Max queryPowerByDate(String selectDate);
	  public List<Power> queryDate3(@Param("startTime")String startTime,@Param("endTime")String endTime);
	  public List<Max> queryTotalData();
	  public String  queryTotalData2();
}
