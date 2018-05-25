package com.ys.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;


import com.ys.model.*;
import com.ys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class AlertController {
	
	@Autowired 
	AlertService service;
	
	@RequestMapping("/queryPageInfo")
	 @ResponseBody
		public List<Alert> queryPageInfo(HttpServletRequest request){
		int page=Integer.parseInt(request.getParameter("pageNum"));
		System.out.println("page"+page);
		List<Alert> alert=service.queryAlertInfo(page);
		
		System.out.println(alert.get(1).getMonitor());
		return alert;
	}
	
	
	@RequestMapping("/queryCount")
	 @ResponseBody
	 @JsonInclude(Include.NON_NULL)
	public Map<String,Integer> queryCount() {
		Map<String,Integer> map=new HashMap<String,Integer>();
		List<Integer> count=service.queryCount();
		map.put("count", count.get(0));
		map.put("no",count.get(1));
		map.put("yes", count.get(0)-count.get(1));
		System.out.println("count列表"+count.get(0));
		System.out.println("count列表"+count.get(1));
		return map;
	}
	
	@RequestMapping("/delRow")
	@ResponseBody
	public boolean delRow(HttpServletRequest request) {
		 service.delRow(Integer.parseInt(request.getParameter("alertId")));
		
		
			return true;
		
	
		
		
	}
}
