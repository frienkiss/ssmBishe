package com.ys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import com.ys.model.Monitor;
import org.springframework.stereotype.Service;

import java.util.List;
import com.ys.dao.IMonitorDao;

import com.ys.service.MonitorService;

@Service("MonitorServiceImpl")
public class MonitorServiceImpl implements MonitorService{
	
	@Autowired
	IMonitorDao Mapper;
	public Monitor queryMonitorById(int seeId) {
		Monitor monitor=Mapper.queryMonitorById(seeId);
		
		return monitor;
	}
	public Monitor queryMonitorByName(String seeName) {
		Monitor monitor=Mapper.queryMonitorByName(seeName);
		return monitor;
	}
	public List<Monitor> queryChildMonitor(int seeId){
		List<Monitor> monitorList=Mapper.queryChildrenMonitor(seeId);
		return monitorList;
	}
	public List<Monitor> queryAllMonitor(){
		List<Monitor> MonitorList=Mapper.queryAllMonitor();
		
		return MonitorList;
	}
}
