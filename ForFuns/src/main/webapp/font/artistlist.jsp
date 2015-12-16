<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Artistlist</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/artistlist.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
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

<script type="text/javascript">
$(document).ready(function(){
	var width = $(".good_item").width();
	var height = width/2.5*3;
  	$(".good_item").height(height);

  	$(window).resize(function() {
  		var width = $(".good_item").width();
		var height = width/2.5*3;
  		$(".good_item").height(height);
  	});
  
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	$(".sub").show();
	$(".box_active a").click(function(){
		$(".sub").slideToggle("slow");
	})
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
					<div class="top-nav-xs hidden-lg">
						<div id="menu">
							<p>菜  单</p>
						</div>
						<div id="menu-xs">
							<ul>
								<li><a href="home.html">首页</a></li>
								<li><a href="home.html">成品</a></li>
								<li><a href="home.html">DIY</a></li>
								<li><a href="home.html">艺术家</a></li>
								<li><a href="newslist.html">资讯中心</a></li>
								<li><a href="home.html">联系我们</a></li>
							</ul>
						</div>
					</div>
					<div class="top-nav visible-lg">
						<ul class="megamenu skyblue">
							<li><a href="home.html">首页</a></li>
							<li><a href="home.html">成品</a></li>
							<li><a href="home.html">DIY</a></li>
							<li><a href="home.html">艺术家</a></li>
							<li><a href="newslist.html">资讯中心</a></li>
							<li><a href="home.html">联系我们</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.html">首页</a> <i> </i> 艺术家列表 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术家列表</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-lg-offset-1 col-lg-10 good_four">

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				

				<div class="col-xs-12 learn_more">
					<p>查看更多</p>
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