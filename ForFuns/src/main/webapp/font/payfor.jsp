<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PayFor</title>
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/payfor.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script src="../js/lanrenzhijia.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script type="text/javascript">
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
		
		function checkTelephone(telephone)
		{
			var strRegex = /[1-9]\d{6,}$/;
			var re = new RegExp(strRegex);
			
			if(!re.test(telephone))
			{
				$("#telephone").focus();
				return false;
			}
			
			return true;
		}
		
		function validate()
		{
			var telephone = $("#telephone").val();
			var address = $("#address").val();
			
			if(telephone == "" || telephone == null || address == "" || address == null)
			{
				alert("信息不完整!");
				return false;
			}
			
			if(!checkTelephone(telephone))
			{
				alert("电话号码格式错误");
				return false;
			}
			
			return true;
		}
		
		//查询是否存在该订单，不存在则继续操作，存在的话核对用户名，如果不是该用户的订单则跳转 0为未登陆 1为为存在这个订单 2为订单与用户相符 3 为订单和用户不相符
		function checkOrder(productid){
			$.ajax({
				type:'post',
				asycn:false,
				url:'<%=basePath%>/product.do?method=checkOrder',
				data:{productid:productid},
				success:function(json){
					//alert(json);
					if(json==0){
						//window.open("Login.jsp");
						var newTab=window.open('about:blank');
						newTab.location.href="Login.jsp";
					}else if(json==3){
						location.href="<%=basePath%>font/error.jsp";
						//跳转到错误页面
					}else if(json==2){
						//相符则为修改页面
						$('#subnav').html("修改订单");
						$('#subtitle').html("修改订单");
					}
				},error:function(){
					
				}
			});
		}
		//通过id获取商品详情 
		function getProductById(id){
			$.ajax({
				type:'post',
				url:'<%=basePath%>/product.do?method=GetProductById',
				data:{productid:id},
				success:function(json){
					var product = json.product;
					var id = product.id;
					var money = "￥"+product.initmoney;
					var name= product.name;
					var imgurl = product.imgurl;
					var authorname = product.authorname;
					var content = product.content;
					var imgone = product.imgone;
					var imgtwo = product.imgtwo;
					var imgthree = product.imgthree;
					var situation = product.situation;
					var methodid = product.methodid;
					var typename = product.typename;
					var timestart = myformatter(product.timestart);
					var timeout = myformatter(product.timeout);
					$('#productid').val(id);
					$('#productname').html(name);
					$('#productname').attr('href','goodsdetail.jsp?productid='+id);
					$('#money').html(money);
					$('#authorname').html(authorname);
				},error:function(){
					
				}
			});
		}
		$(document).ready(function(){
			$('#usernameaction').hide();
			$('#loginoutaction').hide();
			var productid = getUrlParam("productid");
			if(productid==null){
				location.href="404.jsp";
			}
			checkOrder(productid);
			getProductById(productid);
			CheckUser();
			$("#menu").click(function(){
			 $("#menu-xs").toggle(300);
			});
			var width = $(".good_item").width();
			var height = width/4*3;
			$(".good_item").height(height);

			$(window).resize(function() {
			  	var width = $(".good_item").width();
				var height = width/4*3;
			  	$(".good_item").height(height);
			});
			$(".sub").show();
			$(".box_active a").click(function(){
				$(".sub").slideToggle("slow");
			});
			$('.readmore').click(function(){
				
				if(validate()){
					$('#orderform').submit();	
				}else{
					return ;
				}
			});
		});
	</script>
	<style type="text/css">
		*{font-style: normal;}
	</style>
</head>
<body>
	<a href="javascript:;" class="lanrenzhijia_top"></a>
	<div class="header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li id="loginaction" ><a href="Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li id="registeraction"><a href="Register.jsp" ><i class="item_register"> </i>注册账号</a></li>
						<li id="usernameaction"><a href="#" id="username"><i class="item_login"/></a></li>
						<li id="loginoutaction"><a href="<%=basePath %>customer.do?method=loginout" ><i class="item_register"> </i>退出</a></li>			
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
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <font id="subnava">提交订单 </font></h6>
	</div>


	<div class="bar_news">
		<h2 id="subtitle">提交订单</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-xs-offset-1 col-xs-10 good_four">
				<div class="row info1">
					<p class="col-xs-3 title_person">商品信息</p>
				</div>

				<div class="col-xs-12 row goods1">
					<a href="goodsdetail.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item col-xs-3"></a>
					<div class="col-xs-3 name">
						<p class="name1 visible-lg visible-md">商品名称</p>
						<p class="name2"><a href="#" target="_blank" id="productname">商品名称商品名称商品名称商品名称</a></p>
					</div>				
					<div class="col-xs-3 name">
						<p class="name1 visible-lg visible-md">价格</p>
						<p class="name2" id="money">￥99.00</p>
					</div>
					<div class="col-xs-3 name">
						<p class="name1 visible-lg visible-md">艺术家</p>
						<p class="name2"><a href="artistHome.html" target="_blank" id="authorname">艺术家艺术家艺术家</a></p>
					</div>
				</div>
				<form action="<%=basePath%>product.do?method=AddOrder" method="post" id="orderform">
					<div class="row info1">
						<p class="col-xs-3 title_person1">送货信息</p>
					</div>
	
					<div class="col-xs-12 row goods1">
						<input type="hidden" name="productid" id="productid">
						<div class="col-xs-12 row">
							<p class="col-xs-3 label1">联系电话</p>
							<input class="col-xs-offset-1 col-xs-8 label2" type="text" name="telephone" id="telephone"/>
						</div>
						<div class="col-xs-12 row label0">
							<p class="col-xs-3 label1">收货地址</p>
							<input class="col-xs-offset-1 col-xs-8 label2" type="text" name="address" id="address"/>
						</div>					
					</div>
					<div class="col-xs-12 row buy visible-lg visible-md">
						<a href="#" class="col-xs-offset-3 col-xs-6 readmore">提交订单</a>
					</div>
					<div class="col-xs-12 row buy visible-sm visible-xs">
						<a href="#" class="col-xs-12 readmore">提交订单</a>
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