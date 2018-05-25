
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
404
<br>

</body>
<script>
window.onload=function(){
	window.location.href="../index.jsp";
}
</script>
</html>