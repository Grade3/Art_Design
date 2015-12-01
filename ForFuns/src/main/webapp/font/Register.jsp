<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Register.css">
</head>
<body>
	<div id="main_register">
		<form
			action="${pageContext.request.contextPath}/customer.do?method=register"
			method="post">
			<p class="label_input">用户名：</p>
			<input type="text" class="text_input" name="userid"/>
			<p class="label_input">密码：</p>
			<input type="password" class="text_input" name="password"/>
			<p class="label_input">确认密码：</p>
			<input type="password" class="text_input" name="confirm_password"/>

			<p class="label_input">昵称：</p>
			<input type="text" class="text_input" name="username"/>
			<p class="label_input">真实姓名：</p>
			<input type="text" class="text_input" name="realname"/>
			<p class="label_input">二代身份证：</p>
			<input type="text" class="text_input" name="personnumber"/>
			<p class="label_input">手机号码：</p>
			<input type="text" class="text_input" name="telphone"/> <input type="submit"
				value="注  册" class="submit_button" />
			<p class="label_error" id="errormessage1">信息输入不完全！</p>
			<p class="label_error" id="errormessage2">密码两次输入不一致！</p>
		</form>
	</div>
</body>
</html>