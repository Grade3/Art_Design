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
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login1.css">
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
<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="../js/lanrenzhijia.js"></script>
<script>
$(function(){
	$(window).scroll(function(){
		var _top = $(window).scrollTop();
		if(_top>300){
			$('.lanrenzhijia_top').fadeIn(600);
		}else{
			$('.lanrenzhijia_top').fadeOut(600);
		}
	});
	$(".lanrenzhijia_top").click(function(){
		$("html,body").animate({scrollTop:0},500);
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	  $("#menu").click(function(){
	  $("#menu-xs").toggle(300);
	  });
});
</script>

<div class="header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li ><a href="<%=basePath%>font/Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li ><a href="<%=basePath%>font/Register.jsp" ><i class="item_register"> </i>注册账号</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.html">ArtCustomize</a></h1>
					</div>
					<div class="top-nav visible-xs visible-sm">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp" class="menu_home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></br>首页</a></li>
							<li><a href="goodslist.jsp"><span class="glyphicon glyphicon-tower" aria-hidden="true"></span></br>成品</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span></br>DIY</a></li>
							<li><a href="artistlist.jsp"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></br>艺术家</a></li>
							<li><a href="newslist.jsp"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></br>资讯中心</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></br>联系我们</a></li>
						</ul>
					</div>
					<div class="top-nav-xs visible-md">
						<div id="menu">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.jsp">首页</a></li>
								<li><a href="goodslist.jsp">成品</a></li>
								<li><a href="home.html">DIY</a></li>
								<li><a href="artistlist.jsp">艺术家</a></li>
								<li><a href="newslist.jsp">资讯中心</a></li>
								<li><a href="home.html">联系我们</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp">首页</a></li>
							<li><a href="goodslist.jsp">成品</a></li>
							<li><a href="home.html">DIY</a></li>
							<li><a href="artistlist.jsp">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
							<li><a href="home.html">联系我们</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 登陆 </h6>
	</div>

	<div class="container-fluid content" >
		<div class="row">
			<div class="col-md-7 bg_pic">
				<img src="<%=basePath%>image/bg_login1.jpg">

			</div>
			
			<form action="${pageContext.request.contextPath}/customer.do?method=login"
			method="post">
			<div class="col-md-5" id="main_login">
				<div class="row">
					<img src="<%=basePath%>image/login_logo.png" id="bg_pic">
				</div>				
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-2 control-label label_login">用户名</label>
					<div class="col-xs-10 input_div">
						<input type="text" name="userid" class="form-control" id="inputEmail" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-xs-2 control-label label_login">密码</label>
					<div class="col-xs-10 input_div">
						<input type="password" name="password" class="form-control" id="inputPassword" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10 input_div">
						<button type="submit" class="btn btn-default col-xs-12" id="btn_login">登陆</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10 input_div">
						<p class="label_link"><a href="<%=basePath%>font/Register.jsp">注册新账号 >></a></p>
						<p class="label_error" id="errormessage" style="display:none;">用户名或密码错误！</p>
					</div>
				</div>
				
			</div>
			</form>
			
		</div>
		
	</div>

	<div class="bottom-grid1 visible-sm visible-xs">
		<div class="fit1">
			<h3>HAPPY SHOPPING</h3>
			<p>Lorem Ipsum sit amet consectuer adipiscing elitsed diam nonummy nibh euismod</p>
		</div>
	</div>


	<div class="footer">
		<div class="container footer-div">
			<div class="col-md-12 footer-middle">
				<p>公司简介：这里是公司简介公司简介公司简介公司简介公司简介公司简介</p>
				<p>地址：福建省厦门市思明区422号厦门大学</p>
			</div>
			<div class="col-md-12 company">
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.</p>
			</div>
		</div>
	</div>


</body>
</html>