package com.ys.controller;
 
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import com.ys.dao.*;
import com.ys.model.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ys.controller.*;
//使用@Controller注解表示这个类是一个Handler
@Controller
public class HelloController {
	
    //@RequestMapping注解括号里面的表示访问的URL
	@RequestMapping("/login")
    public ModelAndView login(){
	
       ModelAndView modelView = new ModelAndView();
        System.out.println("++++++++进入登陆++++++");
        modelView.addObject("name","bobo");
//     
       modelView.setViewName("hello");
       return modelView;
    //    return "hello";
    }
    //@RequestMapping(method=RequestMethod.GET)  
//	@RequestMapping("/user")
    public String login(ModelMap model) {  
//        User user = new User();
//        user.setInfo("哈哈，bobo最帅！");
//        user.setUserName("bobo");
//        user.setPasswd("12345");s
//        model.addAttribute("str0121", "成功了"); 
//        model.addAttribute("info","用户信息");
//        model.addAttribute("user", user);
//        System.out.println("hello.jsp");
        return "";
    }  

}