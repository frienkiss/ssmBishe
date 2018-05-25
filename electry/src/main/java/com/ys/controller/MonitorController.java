package com.ys.controller;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.ys.model.Monitor;
import com.ys.service.MonitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@Scope("prototype")
@RequestMapping(value="/user",method=RequestMethod.POST)
public class MonitorController {
	
	@Autowired
	MonitorService service;
	@RequestMapping("/selectMonitor")
	@ResponseBody
	public Monitor selectMonitor(HttpServletRequest request) {
		
		Monitor monitor=service.queryMonitorById(1100);
		
		return monitor;
	}
	
	@RequestMapping("/selectAllMonitor")
	@ResponseBody
	public JSONObject selectAllMonitor(HttpServletRequest request){
		List<Monitor> array= new ArrayList<Monitor>();
		
		JSONObject jsonObject=new JSONObject();
		//Object obj=new Object();
		List<Monitor> monitor=service.queryAllMonitor();		
		List<Monitor> monitor2=service.queryChildMonitor(1000);		
		Monitor parMonitor=service.queryMonitorById(1000);	
		List<JSONObject> array_root= new ArrayList<JSONObject>();
	
		List<JSONObject> array_sec= new ArrayList<JSONObject>();
		JSONObject obj3=new JSONObject();
		for(int i=0;i<monitor2.size();i++) {
			//array_sec.clear();
			List<Monitor> monitor3=service.queryChildMonitor(monitor2.get(i).getSeeId());
			
			JSONObject obj = new JSONObject();
			List<JSONObject> array2= new ArrayList<JSONObject>();
			for(int j=0;j<monitor3.size();j++) {
				JSONObject obj2=new JSONObject();
				//array2.clear();
				obj2.put("label",monitor3.get(j).getSeeName());
				array2.add(obj2);
			}			
			obj.put("label", monitor2.get(i).getSeeName());
			obj.put("children", array2);
			array_sec.add(obj);			
		}	
		obj3.put("label", parMonitor.getSeeName());
		obj3.put("children", array_sec);
		array_root.add(obj3);
		jsonObject.put("data", array_root);
		
		System.out.println(jsonObject);
		return jsonObject;
	}
	
	
}
