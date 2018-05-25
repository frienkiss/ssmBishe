package com.ys.controller;
/**
 * 分析工具
 */
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import java.util.Map;
import java.util.HashMap;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
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

@Controller
@Scope("prototype")
@RequestMapping("/user")

public class MaxController {
	@Autowired
	MaxService maxService;
	//@RequestMapping("select")
	 @RequestMapping(value = "/selectMax", method = RequestMethod.POST)
    @ResponseBody
 
	public List<Max> selectMax(HttpServletRequest request) {
		 	String start=request.getParameter("startTime");
		 	String end=request.getParameter("endTime");
			
			List<Max> time=maxService.selectDate(start,end);	
			System.out.println("end"+end);
			if(end==null||end=="") {
				time=maxService.selectDate2(start);	
			}
			if(time==null) {
				System.out.println("null");
				return null;
			}

		    return time;
	}
	 //负荷总览
	 @RequestMapping(value = "/fuheTotal", method = RequestMethod.POST)
	 @ResponseBody
	 public JSONObject fuheTotal(@RequestBody String json) {
		 System.out.println("测试json"+json);
		 JSONObject str = new JSONObject();
		 JSONObject js=JSONObject.parseObject(json);
		 JSONArray arr=new JSONArray();
		 for(int i=1;i<=js.size();i++) {
			 JSONObject json2=new JSONObject();
			 System.out.println(js.getString("selectDate"+i));
			 Max max = maxService.queryPowerByDate(js.getString("selectDate"+i));
			 System.out.println("controller   "+max);
			// System.out.println(max.getPvalue());
			 if(max==null) {
				// return null;//考虑抛出 java.lang.NullPointerException的异常报错
				 json2.put("selectDate"+i+"",null);
				 arr.add(json2);
				 continue;
			 }
			 json2.put("selectDate"+i+"",max.getPvalue());
			 arr.add(json2);
			 }
		 
System.out.println(arr);
str.put("data", arr);
		// js.get
		 
		// Max max=maxService.queryPowerByDate(request.getParameter("select"))
		 return str;
	 }
	 //碳排放分析
	 @RequestMapping(value = "/selectCO", method = RequestMethod.POST)
	 @ResponseBody
	 public JSONObject  selectCO(HttpServletRequest request){
		 List<Max> max=maxService.selectDate(request.getParameter("selectDate"));
		 JSONArray array=new JSONArray();
		
		 String selectDate=request.getParameter("selectDate");
		 System.out.println(selectDate);
		for(int i=0;i<3;i++) {
			System.out.println("i+  "+max.get(i).getSeeName());
			 JSONObject jsonObject=new JSONObject();//放入for循环中，不然只会保留i=2的值
			jsonObject.put("name", max.get(i).getSeeName());
			jsonObject.put("value", max.get(i+3).getSeeName());//这里也要写getSeeName，因为后台查到的是seename，但是也查了pvalue，但却不能用getpvalue。。。奇怪
			array.add(jsonObject);
		}
		for(int j=3;j<max.size();j++) {
			System.out.println("j   "+max.get(j).getSeeName());
			
		}
		
		System.out.println("碳排放"+max);
		JSONObject json=new JSONObject();
		json.put("data", array);
		 return json;
	 }
	 
	 //综合预览-当日数据
	 @RequestMapping(value = "/selectTotalData", method = RequestMethod.POST)
	 @ResponseBody
	 @JsonInclude(Include.NON_NULL)
	 public Map<String,Integer> selectTotalData(){
		 List<Max> total=maxService.selectTotalData();
		 Map<String,Integer> map=new HashMap<String,Integer>();	
		// int->String  String.valueOf(b);
		map.put("todayEle",total.get(0).getPvalue());
		 map.put("monthEle",total.get(1).getPvalue());

		 return map;
	 }
	 @RequestMapping(value = "/selectDateValue", method = RequestMethod.POST)
	 @ResponseBody
	// @JsonInclude(Include.NON_NULL)//无效什么鬼
	 //@JSON(type = Article.class, filter="pdate,pvalue")
	 @JsonIgnoreProperties({ "seedid", "ptime","ptype","updatetime","pid","tid" })
	 public List<Power> selectDateValue(){
		 List<Power> eleAnalysis=maxService.selectDate3("2018-01-08", "2018-01-16");
		 
		 return eleAnalysis;
	 }
	 
}
