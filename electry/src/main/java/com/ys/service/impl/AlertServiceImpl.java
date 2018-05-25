package com.ys.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import com.ys.model.*;
import org.springframework.stereotype.Service;

import java.util.List;
import com.ys.dao.IAlertDao;

import com.ys.service.AlertService;

@Service("AlertServiceImpl")
public class AlertServiceImpl implements AlertService{
	
	@Autowired
	private IAlertDao Mapper;
		public  List<Alert> queryAlertInfo(int startNum) {
			List<Alert> alertInfo=Mapper.queryAlertInfo(startNum);
			
			
			return alertInfo;
		}
	public List<Integer> queryCount() {
		List<Integer> count=Mapper.queryCount();
		return count;
		}
	
	public void delRow(int alertId) {
		Mapper.delRow(alertId);
		
	}
}
