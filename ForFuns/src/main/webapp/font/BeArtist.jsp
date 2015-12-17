<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>BeArtist</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/BeArtist.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="../js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
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

<script type="text/javascript">
$(document).ready(function(){
	var width = $(".userpic").width();
	var height = width;
	$(".userpic").height(height);

	$(window).resize(function() {
		var width = $(".userpic").width();
		var height = width;
		$(".userpic").height(height);
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
						<li ><a href="Login.html" ><i class="item_login"> </i>登陆</a></li>
						<li ><a href="Register.html" ><i class="item_register"> </i>注册账号</a></li>			
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
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <a href="personal.html">个人中心</a> <i> </i> 申请成为艺术家 </h6>
	</div>


	<div class="bar_news">
		<h2>申请成为艺术家</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="row person_info">
				<div class="col-xs-offset-1 col-xs-10 info_div visible-lg">
					<div class="row info1">
						<p class="col-xs-4 title_person">身份信息</p>						
					</div>
					<div class="row">
						<p class="col-xs-12 message">（请核对您的身份信息，系统将会根据您填写的信息对您的身份进行审核）</p>
					</div>
					<div class="row info">
						<p class="col-xs-4">真实姓名</p>
						<input type="text" class="col-xs-8" value="孔日天">
					</div>
					<div class="row info">
						<p class="col-xs-4">身份证</p>
						<input type="text" class="col-xs-8" value="123123133313131323">
					</div>
					<div class="row info">
						<p class="col-xs-4">手机</p>
						<input type="text" class="col-xs-8" value="12312341234">
					</div>
					<div class="row info">
						<p class="col-xs-4">支付宝</p>
						<input type="text" class="col-xs-8" placeholder="请输入支付宝账号">
					</div>
					<div class="row info info2">
						<p class="col-xs-4">擅长领域</p>
						<input type="text" class="col-xs-8" placeholder="请输入您擅长的艺术领域">
					</div>
				</div>
				<div class="info_div hidden-lg">
					<div class="row info1">
						<p class="col-xs-4 title_person">身份信息</p>						
					</div>
					<div class="row">
						<p class="col-xs-12 message">（请核对您的身份信息，系统将会根据您填写的信息对您的身份进行审核）</p>
					</div>
					<div class="row info">
						<p class="col-xs-4">真实姓名</p>
						<input type="text" class="col-xs-8" value="孔日天">
					</div>
					<div class="row info">
						<p class="col-xs-4">身份证</p>
						<input type="text" class="col-xs-8" value="123123133313131323">
					</div>
					<div class="row info">
						<p class="col-xs-4">手机</p>
						<input type="text" class="col-xs-8" value="12312341234">
					</div>
					<div class="row info">
						<p class="col-xs-4">支付宝</p>
						<input type="text" class="col-xs-8" placeholder="请输入支付宝账号">
					</div>
					<div class="row info info2">
						<p class="col-xs-4">擅长领域</p>
						<input type="text" class="col-xs-8" placeholder="请输入您擅长的艺术领域">
					</div>
				</div>	
			</div>


			<div class="row buy_info">
				<div class="col-xs-offset-1 col-xs-10 info_div visible-lg">
					<div class="row info1">
						<p class="col-xs-4 title_person">艺术家协议</p>						
					</div>
					<div class="row">
						<p class="col-xs-12 message">（请仔细阅读下面的协议，只有接受协议才能申请成为艺术家）</p>
					</div>
					<div class="row label1">
						<p class="col-xs-12">协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容</p>
					</div>
				</div>
				<div class="info_div hidden-lg">
					<div class="row info1">
						<p class="col-xs-4 title_person">艺术家协议</p>						
					</div>
					<div class="row">
						<p class="col-xs-12 message">（请仔细阅读下面的协议，只有接受协议才能申请成为艺术家）</p>
					</div>
					<div class="row label1">
						<p class="col-xs-12">协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容协议内容</p>
					</div>
				</div>	

				<div class="col-xs-offset-1 col-xs-10 agree visible-lg">
					<input type="checkbox" /><p>我已阅读并同意该协议</p>
				</div>

				<div class="col-xs-12 agree hidden-lg">
					<input type="checkbox" /><p>我已阅读并同意该协议</p>
				</div>

				<div class="col-xs-12 success_btn visible-lg">
					<input type="submit" class="col-xs-offset-1 col-xs-10" value="提交申请">
				</div>		

				<div class="col-xs-12 success_btn hidden-lg">
					<input type="submit" class="col-xs-12" value="提交申请">
				</div>	
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