<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Login.css">
</head>
<body>
	<div id="main_login">
		<img src="<%=basePath%>/image/Title.png" class="Logo_img">
		<input type="text" class="text_input" placeholder="请输入用户名" />
		<input type="password" class="text_input" placeholder="请输入密码" />
		<input type="submit" value="登  陆" class="submit_button" />
		<p class="label_error">用户名或密码错误！</p>
		<p class="label_link"><a href="Register.html">注册新账号</a></p>
	</div>
</body>
</html>