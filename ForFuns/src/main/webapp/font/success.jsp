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
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/404.css">
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var successid = getUrlParam('successid');
			if(null==successid){
			}else if(successid==1){
				$('.readmore').html('返回订单页面');
				$('.readmore').attr('href',"<%=basePath%>order.do?method=EnterMyOrder");
			}else if(successid==2){
				$('.readmore').html('返回个人信息页面 ');
				$('.readmore').attr('href',"<%=basePath%>font/personal.jsp");
			}
			
		});
	</script>
</head>
<body>

	<div class="content">
		<div class="container">
			<div class="main_404">
				<img src="<%=basePath%>image/succeed.png">
				<p class="label_wrong">恭喜您！操作成功！</p>
				<a href="home.jsp" class="readmore">返回首页</a>
			</div>
		</div>
	</div>

</body>
</html>