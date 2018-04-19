package com.ys.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import com.ys.dao.IMaxDao;
import com.ys.model.Max;
import com.ys.service.MaxService;

@Service("MaxServiceImpl")
public class MaxServiceImpl implements MaxService {
	// TODO Auto-generated method stub
	//@OverRide
	@Autowired
	IMaxDao Mapper;
	public List<Max> selectDate(String startTime,String endTime) {
			System.out.println("进入调试"+startTime);
			List<Max> time=Mapper.queryDate(startTime,endTime);
			System.out.println("Mapper"+time);
			if(time.size()==0) {
				return null;
			}
			return time;
			
		
	}
	public List<Max> selectDate(String startTime) {
		System.out.println("进入调试"+startTime);
		List<Max> time=Mapper.queryDate(startTime);
		System.out.println("Mapper"+time);
		return time;
		
	
}
}
