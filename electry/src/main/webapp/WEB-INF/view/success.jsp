
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@ page isELIgnored="false" %> 
<html>
<head>
    <title></title>
</head>
<body>

登入成功!
<br>
您好!${user.username}
<br>
<a href="/login.jsp">返回</a>
</body>
</html>