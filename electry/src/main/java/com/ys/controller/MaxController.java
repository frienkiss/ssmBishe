package com.ys.controller;

import java.util.List;
import com.ys.model.Max;
import com.ys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class MaxController {
	@Autowired
	MaxService maxService;
	//@RequestMapping("select")
	 @RequestMapping(value = "/select", method = RequestMethod.POST)
    @ResponseBody
 
	public List<Max> select(HttpServletRequest request) {
		 	String start=request.getParameter("startTime");
		 	String end=request.getParameter("endTime");
			
			List<Max> time=maxService.selectDate(start,end);	
			if(time==null) {
				System.out.println("null");
				return null;
			}
			System.out.println("测试"+time.get(0).getStartTime());
			for(int i=0;i<time.size();i++) {
				System.out.println(time.get(i).getEndTime());
			}
			//String jsonTime=time.toString();
		    String jsonString = "{'data':[{'startTime':'2018-10-1'}]}";
		   // return jsonString;
		    return time;
	}
}
