<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/> --%>
   
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %> 
<%String path = request.getContextPath();  
//http://localhost:8080/项目名/   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=path %>/static/css/style.css" type="text/css" rel="stylesheet">
<style>
	body{color:#fff;  font-size:14px;}
	.wrap1{position:absolute; top:0; right:0; bottom:0; left:0; margin:auto }
	.main_content{
		background:url("<%=path %>/static/images/main_bg.png") repeat; text-align:left; float:none; border-radius:8px;
		margin:0 auto;
	}
	
	.form-group{position:relative;}
	
	.login_btn{display:block; background:transparent; color:#f8f8f8;border:1px solid #f8f8f8!important; font-size:15px; width:100%; line-height:50px; border-radius:30px!important; border:none; }
	.login_input{width:100%; border:1px solid #f8f8f8;  line-height:40px; padding:2px 5px 2px 30px; background:transparent!important;}
	i{color:#999;top:32px!important;left:10px;}
	.font16{font-size:16px;}
	.mg-t20{margin-top:20px;}
	.main_content{width:400px}
	
	input{outline:none}
	
	  input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 1000px white inset;  /*使用足够大的纯色内阴影覆盖黄色背景*/
	border: 1px solid #CCC!important;
	}/*改变谷歌浏览器默认输入框黄色背景样式，或者使用query*/
	@media (min-width:200px){.pd-xs-20{padding:20px;}}
	@media (min-width:768px){.pd-sm-50{padding:50px;}}
	#grad {
	  background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Safari 5.1 - 6.0 */
	  background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Opera 11.1 - 12.0 */
	  background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3); /* Firefox 3.6 - 15 */
	  background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */ 
	}
</style>

</head>

<body style="background:url(<%=path %>/static/images/bg.jpg) no-repeat;">
    
    <div class="container wrap1" style="height:450px;">
            <h2 class="mg-b20 text-center">电力能源管理平台</h2>
            <div class="col-sm-8  center-auto pd-sm-50 pd-xs-20 main_content">
              
                <form action="user/login" method="post" >
                    <div class="form-group mg-t20">
                        <i class="glyphicon glyphicon-user"></i>
                        <input type="text" class="login_input" id="username" name="username" autocomplete=”off” placeholder="请输入用户名" />
                    </div>
                    <div class="form-group mg-t20">
                        <i class="glyphicon glyphicon-lock"></i>
                        <input type="password" class="login_input" autocomplete=”off”  name="password" id="password" placeholder="请输入密码" />
                    </div>
                    <div class="checkbox mg-b25">
                        <label>
                            <input type="checkbox" />记住我的登录信息
                        </label>
                    </div>
                    <button style="submit" class="login_btn" name="submit" type="submit">登 录</button>
           
               </form>
                        <button class="reg">注册</button>
        </div><!--row end-->
    </div><!--container end-->
    <script src="<%=path %>/static/scripts/jquery-1.12.4.min.js"></script>
      <script>
      $(".reg").on("click",function(){
    	   	$.ajax({
          		url:'user/Register',
          		data:{'username':$("#username").val(),'password':$("#password").val()},
          		//datatype:'json',
          		type:'post',
          		success:function(msg){
          			console.log(msg);
          		}
          	})
      })
    

      </script>     
</body>
</html>
