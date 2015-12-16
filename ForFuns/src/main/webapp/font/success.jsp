<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Success</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/404.css">
</head>
<body>

	<div class="content">
		<div class="container">
			<div class="main_404">
				<img src="../image/succeed.png">
				<p class="label_wrong">恭喜您！操作成功！</p>
				<a href="home.html" class="readmore">返回首页</a>
			</div>
		</div>
	</div>

</body>
</html>