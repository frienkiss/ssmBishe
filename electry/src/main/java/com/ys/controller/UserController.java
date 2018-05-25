package com.ys.controller;

import com.ys.model.User;
import com.ys.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;




/**
 * Created by alvin on 15/9/7.
 */

//@Controller注解用于标示本类为web层控制组件
@Controller
//@RequestMapping("/user")用于标定访问时对url位置
//@OverRide
@RequestMapping("/user")
//在默认情况下springmvc的实例都是单例模式,所以使用scope域将其注解为每次都创建一个新的实例
@Scope("prototype")
public class UserController {
    //自动注入业务层的userService类
//	@Resource  
	 @Autowired  
    UserService userService;

    //login业务的访问位置为/user/login
    @RequestMapping("/login")
       public String login(User user,HttpServletRequest request) throws UnsupportedEncodingException{
        //调用login方法来验证是否是注册用户
    	System.out.println(user.getUsername()+"   "+user.getPassword());
    	if(user.getUsername()==null || user.getPassword()==null) {
    		return "error";
    	}
    	String u = user.getUsername();
    u=new String(u.getBytes("iso-8859-1"),"utf-8");//设置传过来的参数编码，不会造成中文乱码
    
    System.out.println(u);
    	  //	request.setCharacterEncoding("utf-8");
        boolean loginType = userService.login(u,user.getPassword());
        if(loginType){
            //如果验证通过,则将用户信息传到前台
            request.setAttribute("user",user);
            //并跳转到success.jsp页面
            return "hello";
        }else{
            //若不对,则将错误信息显示到错误页面
            request.setAttribute("message","用户名密码错误");
            return "error";
        }


}
    @RequestMapping(value="/Register",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> Register(HttpServletRequest request) throws UnsupportedEncodingException{
    	String username=request.getParameter("username");
    	String password=request.getParameter("password");
   	 Map<String,String> map=new HashMap<String,String>();	
   		// int->String  String.valueOf(b);

  //  	System.out.println("注册");
    		boolean status=userService.Register(username, password);
   // 	System.out.println(status);
    		if(status==true) {
    			System.out.println("注册成功");
    			map.put("success","注册成功");
    		}else {
    			 map.put("fail","注册失败");
    		}
    		 return map;


    }
}