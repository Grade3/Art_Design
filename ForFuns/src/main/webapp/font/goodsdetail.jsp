<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<title>Goodsdetail</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/goodsdetail.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="../js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
<script>
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}; 
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};

//通过id获取商品详情 
function getProductById(id){
	$.ajax({
		type:'post',
		url:'<%=basePath%>/product.do?method=GetProductById',
		data:{productid:id},
		success:function(json){
			var product = json.product;
			var id = product.id;
			var name= product.name;
			var imgurl = product.imgurl;
			var authorname = product.authorname;
			var content = product.content;
			var imgone = product.imgone;
			var imgtwo = product.imgtwo;
			var imgthree = prodcut.imgthree;
			var situation = product.situation;
			var methodid = prodcut.methodid;
		},error:function(){
			
		}
	});
}
$(document).ready(function(){
	var productid = getUrlParam("productid");
	getProductById(productid);
});
</script>
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
	var width = $(".good_item img").width();
	var height = width;
  	$(".good_item img").height(height);

  	var width_s = $(".good_pic img").width();
  	var height_s = width_s;
  	$(".good_pic img").height(height_s);

  	$(window).resize(function() {
  		var width = $(".good_item img").width();
		var height = width;
  		$(".good_item img").height(height);

  		var width_s = $(".good_pic img").width();
  		var height_s = width_s;
  		$(".good_pic img").height(height_s);
  	});
  
});
</script>

<script type="text/javascript">
$(document).ready(function(){

	var src1 = "../image/good.jpg";
	var src2 = "../image/bl.jpg";
	var src3 = "../image/bl2.jpg";


  	$(".pic1").click(function() {
  		$(".pic").attr("src",src1);
  	});

  	$(".pic2").click(function() {
  		$(".pic").attr("src",src2);
  	});

  	$(".pic3").click(function() {
  		$(".pic").attr("src",src3);
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
					<div class="top-nav-xs hidden-lg">
						<div id="menu" onmouseover="fun1();" onmouseout="fun2();">
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
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <a href="goodslist.html">艺术品列表</a> <i> </i> 艺术品详情 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术品详情</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-xs-12">
				<div class="col-md-6 good_show">
					<div class="col-xs-12 good_item">
						<img src="../image/good.jpg" class="pic">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="../image/good.jpg" class="pic1">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="../image/bl.jpg" class="pic2">
					</div>
					<div class="col-xs-4 good_pic">
						<img src="../image/bl2.jpg" class="pic3">
					</div>
				</div>
				<div class="col-md-6 good_detail">
					<p class="good_name">商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称</p>
					<div class="row price">
						<p class="col-xs-3 good_price1">一口价</p>
						<p class="col-xs-9 good_price">￥98.00</p>
					</div>
					<div class="row trans">
						<p class="col-xs-3 good_other">配送</p>
						<p class="col-xs-9 good_other">卖家城市 快递公司</p>
					</div>
					<div class="row other">
						<p class="col-xs-3 good_other">艺术品分类</p>
						<p class="col-xs-9 good_other">分类6</p>
					</div>
					<div class="row">
						<p class="col-xs-3 good_other">上架时间</p>
						<p class="col-xs-9 good_other">2015-12-7 8:00</p>
					</div>
					<div class="row">
						<p class="col-xs-3 good_other">下架时间</p>
						<p class="col-xs-9 good_other">2015-12-31 23:59</p>
					</div>
					<div class="row artist">
						<p class="col-xs-3 good_other">艺术家</p>
						<p class="col-xs-9 good_artist">艺术家名称</p>
						<a href="artist.html" class="col-xs-4 readmore" target="_blank">进入艺术家主页</a>
					</div>
					<div class="row buy">
						<a href="buy.html" class="col-xs-12 readmore">现在购买</a>
					</div>
				</div>
			</div>

			<div class="col-xs-12 description">
				<div class="des_title">
					<p>图文详情</p>
					<label class="line"></label>
				</div>
				<p class="des_p">这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述这里是商品详细描述</p>
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