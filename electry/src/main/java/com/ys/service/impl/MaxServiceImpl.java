package com.ys.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import com.ys.model.*;
import org.springframework.stereotype.Service;

import java.util.List;
import com.ys.dao.IMaxDao;

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
	public List<Max> selectDate2(String startTime) {
		System.out.println("进入调试"+startTime);
		List<Max> time=Mapper.queryDate2(startTime);
		System.out.println("Mapper"+time);
		return time;
	}
	public List<Power> selectDate3(String startTime,String endTime) {
		System.out.println("进入调试"+startTime);
		List<Power> time=Mapper.queryDate3(startTime,endTime);
		System.out.println("Mapper"+time);
		if(time.size()==0) {
			return null;
		}
		return time;	
}
	//碳排放
	public List<Max> selectDate(String selectDate) {
		List<Max> time=Mapper.queryDate4(selectDate);
		
		return time;
	}
	//负荷总览
	public Max queryPowerByDate(String selectDate) {
		try {
	
		Max max=Mapper.queryPowerByDate(selectDate);
		System.out.println("service"+max);
		if(max==null) {
			return null;
		}
		return max;
		}catch (Exception e) {
			System.out.println("无数据");
			return null;
		}
	}
	public List<Max> selectTotalData(){
		//请考虑数据库无数据抛出java.lang.NullPointerException异常的情况
		System.out.println("进入调试");
		List<Max>  total=Mapper.queryTotalData();
		System.out.println("total"+total.get(0).getPvalue());
		System.out.println("total"+total.get(1).getPvalue());//虽然是求和，但是还是pvalue那个字段
		return total;
	}
	public String selectTotalData2(){
		System.out.println("进入调试");
		String  total=Mapper.queryTotalData2();
		System.out.println("total2"+total);
	
		return total;
	}
}
