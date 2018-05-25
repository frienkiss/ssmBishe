package com.ys.service;
/**
 * @author liushaobo
 */

import com.ys.model.*;

import java.util.List;

public interface MaxService {
	  public List<Max> selectDate(String startTime,String endTime);
	  public List<Max> selectDate2(String startTime);
	  //当月碳排放
	  public List<Max> selectDate(String selectDate);
	  public Max queryPowerByDate(String selectDate);
	  public List<Power> selectDate3(String startTime,String endTime);
	  public List<Max> selectTotalData();
	  public String selectTotalData2();
	  }
