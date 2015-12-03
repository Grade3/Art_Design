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
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/Register.css">
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
						<li ><a href="Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li ><a href="Register.jsp" ><i class="item_register"> </i>注册账号</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.jsp">ArtCustomize</a></h1>
					</div>
					<div class="top-nav-xs hidden-lg">
						<div id="menu" onmouseover="fun1();" onmouseout="fun2();">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.jsp">首页</a></li>
								<li><a href="home.jsp">成品</a></li>
								<li><a href="home.jsp">DIY</a></li>
								<li><a href="home.jsp">艺术家</a></li>
								<li><a href="newslist.jsp">资讯中心</a></li>
								<li><a href="home.jsp">联系我们</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.jsp">首页</a></li>
							<li><a href="home.jsp">成品</a></li>
							<li><a href="home.jsp">DIY</a></li>
							<li><a href="home.jsp">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
							<li><a href="home.jsp">联系我们</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 注册 </h6>
	</div>


	<div class="bar_news">
		<h2>注册账号</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-sm-offset-2 col-md-8 visible-md visible-lg">
			<form action="${pageContext.request.contextPath}/customer.do?method=register"
			method="post">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label label_login">用户名</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="userid" class="form-control inputSth" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">密码</label>
					<div class="col-sm-10 input_div">
						<input type="password" name="password" class="form-control inputSth" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">确认密码</label>
					<div class="col-sm-10 input_div">
						<input type="password" name="confirm_password" class="form-control inputSth" placeholder="请再次输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">昵称</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="username" class="form-control inputSth" placeholder="请输入昵称">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">真实姓名</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="realname" class="form-control inputSth" placeholder="请输入真实姓名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">身份证</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="personnumber" class="form-control inputSth" placeholder="请输入二代身份证号">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">手机</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="telphone" class="form-control inputSth" placeholder="请输入手机号码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
						<button type="submit" class="btn btn-default col-sm-12" id="btn_login">注册</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
						<p class="label_error1" id="errormessage1">输入信息不完整！</p>
						<p class="label_error1">用户名已被注册！</p>
						<p class="label_error" id="errormessage2">两次密码不一致！</p>
						<div class="success">
							<img src="../image/success_pic.png">
							<p>注册成功</p>
						</div>
					</div>
				</div>
				</form>
			</div>

			<div class="col-md-8 visible-sm visible-xs">
			<form action="${pageContext.request.contextPath}/customer.do?method=register"
			method="post">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label label_login">用户名</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="userid" class="form-control inputSth" placeholder="请输入用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">密码</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="password" class="form-control inputSth" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">确认密码</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="confirm_password" class="form-control inputSth" placeholder="请再次输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">昵称</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="username" class="form-control inputSth" placeholder="请输入昵称">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">真实姓名</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="realname" class="form-control inputSth" placeholder="请输入真实姓名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">身份证</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="personnumber" class="form-control inputSth" placeholder="请输入二代身份证号">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label label_login">手机</label>
					<div class="col-sm-10 input_div">
						<input type="text" name="telphone" class="form-control inputSth" placeholder="请输入手机号码">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
						<button type="submit" class="btn btn-default col-sm-12" id="btn_login">注册</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 input_div">
						<p class="label_error1" id="errormessage1">输入信息不完整！</p>
						<p class="label_error1">用户名已被注册！</p>
						<p class="label_error" id="errormessage2">两次密码不一致！</p>
						<div class="success">
							<img src="../image/success_pic.png">
							<p>注册成功</p>
						</div>
					</div>
				</div>
				</form>
			</div>
				
		</div>
	</div>


	<div class="bottom-grid1">
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