<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin_login</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Admin_login.css">
<script type="text/javascript">
<script type="text/javascript">
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
};    
$(document).ready(function(){
	var error = getUrlParam("error");
}); 
</script>

</script>
</head>
<body>
	<div id="main_login">
		<img src="<%=basePath%>image/title_admin.png" class="Logo_img">
		<input type="text" class="text_input" placeholder="请输入用户名" />
		<input type="password" class="text_input" placeholder="请输入密码" />
		<input type="submit" value="登  陆" class="submit_button" />
		<p class="label_error">用户名或密码错误！</p>
	</div>
</body>
</html>