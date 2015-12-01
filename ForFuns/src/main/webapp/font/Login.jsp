<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width,height=device-height, initial-scale=0.5, minimum-scale=0.5,  user-scalable=yes" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Login.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	};    
	$(document).ready(function(){
		var error = getUrlParam("error");
		if(error==2){
			$('#errormessage').html("请登录");
			$('#errormessage').show();
		}else if(error==1){
			$('#errormessage').show();
		}
	}); 
	</script>
</head>
<body>
	<div id="main_login">
		<form action="${pageContext.request.contextPath}/customer.do?method=login"
			method="post">
			<img src="<%=basePath%>/image/Title.png" class="Logo_img"> <input
				type="text" class="text_input"name="userid" placeholder="请输入用户名" /> <input
				type="password" class="text_input" name="password"placeholder="请输入密码" /> <input
				type="submit" value="登  陆" class="submit_button" />
			<p class="label_error" id="errormessage">用户名或密码错误！</p>
			<p class="label_link">
				<a href="Register.jsp">注册新账号</a>
			</p>
		</form>
	</div>
</body>
</html>