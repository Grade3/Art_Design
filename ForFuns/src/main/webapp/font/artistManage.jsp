<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" id="viewport" content="width=device-width, initial-scale=1">
	<title>ArtistManage</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/artistManage.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
</head>
<body>
<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>
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

	var width = $(".good_item").width();
	var height = width/2.5*3;
  	$(".good_item").height(height);
  	var pic_h = $(".pic").height()
  	$(".detail").height(pic_h);

  	var width = $(".userpic").width();
	var height = width;
	$(".userpic").height(height);

	var title_w = $(window).width();
	$(".title_bar").width(title_w);

  	$(window).resize(function() {
  		var width = $(".good_item").width();
		var height = width/2.5*3;
  		$(".good_item").height(height);
  		var pic_h = $(".pic").height()
  		$(".detail").height(pic_h);

	  	var width = $(".userpic").width();
		var height = width;
		$(".userpic").height(height);


		var title_w = $(window).width();
		$(".title_bar").width(title_w);
  	});
  
});
</script>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-tower" aria-hidden="true"></span>&nbsp;&nbsp;我的艺术品</p>
	</div>
</div>

	<div class="col-xs-12 header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li class="li1"><a href="Login.html" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;登陆</a></li>
						<li class="li2"><a href="Register.html" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;注册账号</a></li>			
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
							<li><a href="home.html" class="menu_home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></br>首页</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-tower" aria-hidden="true"></span></br>艺术品</a></li>
							<li><a href="home.html"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></br>艺术家</a></li>
							<li><a href="newslist.html"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></br>资讯中心</a></li>
						</ul>
					</div>
					<div class="top-nav-xs visible-md">
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
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <a href="artistHome.html">艺术家主页</a> <i> </i> 发布管理 </h6>
	</div>


	<div class="bar_news">
		<h2>发布管理</h2>
	</div>


	<div class="content">
		<div class="container">

			<div class="row artwork">
				<div class="col-xs-12 good_four">

					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>

					<!--大图第一行结束-->


					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>

					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>
					<!--大图第二行结束-->

					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 goods_two">
						<div class="col-md-6 goods pic">
							<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						</div>
						<div class="col-md-6 goods detail">
							<div class="good_name">
								<p class="name">商品名称</p>
								<p class="other">分类：分类1</p>
								<p class="other">上架时间：2015-12-7</p>
								<p class="other">下架时间：2015-12-31</p>
								<p class="other">拍卖 - 已上架</p>
								<p class="price">价格：￥99.0</p>
								<a class="col-xs-12 readmore operation" target="_blank">上架</a>
								<a href="artistModify.html" class="col-xs-12 readmore operation oper1" target="_blank">修改</a>
								<a class="col-xs-12 readmore operation oper2" target="_blank">删除</a>
							</div>
						</div>
					</div>

					<div class="col-xs-12 learn_more">
						<p>查看更多</p>
					</div>
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