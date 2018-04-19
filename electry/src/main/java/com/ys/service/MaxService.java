package com.ys.service;



import com.ys.model.Max;

import java.util.List;

public interface MaxService {
	  public List<Max> selectDate(String startTime,String endTime);
	  public List<Max> selectDate(String startTime);
}
