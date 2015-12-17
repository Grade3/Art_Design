<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Personal</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/personal.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
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

<script>
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};

//获取用户信息
function GetUser()
{
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	
	$.ajax({
		type:'post',
		url:'<%=basePath%>customer.do?method=getCustomerByUserid',
		data:{customerid:id},
		success:function(json){
			var customer = json.customer;
			var userid = customer.userid;
			var username = customer.username;
			var personnumber = customer.personnumber;
			var telphone = customer.telphone;
			var realname = customer.realname;
			var avator = customer.avator;
			var isartist = customer.isartist;
			
			if (isartist == "0")
			{
				$('#showme_div').hide();
				$('#advantage_div').hide();
			}
			
			$('#username').html(username);
			$('#userid').html(userid);
			$('#personnumber').html(personnumber);
			$('#telphone').html(telphone);
			$('#realname').html(realname);
		},error:function(){
			
		}
	});
}
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
	GetUser();
	
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
						<li ><a href="Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li ><a href="Register.jsp" ><i class="item_register"> </i>注册账号</a></li>			
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
							<li><a href="home.html"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></br>艺术家</a></li>
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
							<li><a href="home.jsp">首页</a></li>
							<li><a href="goodslist.jsp">成品</a></li>
							<li><a href="home.html">DIY</a></li>
							<li><a href="home.html">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
							<li><a href="home.html">联系我们</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 个人中心 </h6>
	</div>


	<div class="bar_news">
		<h2>个人中心</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="main_up">
				<div class="user_info">
					<img class="userpic" src="../image/bl.jpg" id = "avator">
					<p class="username" id = "userid">我的用户名</p>
				</div>
				<div class="row person_btn">
					<div class="col-xs-offset-4 col-xs-4 visible-lg">
						<a href="BeArtist.html" class="col-xs-5 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a  href="modify.jsp" class="col-xs-5 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-offset-3 col-xs-6 visible-md">
						<a href="BeArtist.html" class="col-xs-5 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-5 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-12 visible-sm btn-xs">
						<a href="BeArtist.html" class="col-xs-6 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-6 readmore modify">修改个人信息</a>
					</div>
					<div class="col-xs-12 visible-xs btn-xs">
						<a href="BeArtist.html" class="col-xs-6 readmore beartist">申请成为艺术家<!--我的个人主页--></a>
						<a href="modify.jsp" class="col-xs-6 readmore modify">修改个人信息</a>
					</div>
				</div>
			</div>


			<div class="main-mid">
				<div class="row person_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;账号信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-user"></span>　昵称</p>
							<p class="col-xs-9" id="username">我的昵称</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-lock"></span>　修改密码</p>
							<p class="col-xs-9"><a href="modifyPassword.html"><span class="glyphicon glyphicon-edit"></span> 点击修改密码</a></p>
						</div>
						<div class="row info" id="advantage_div">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-heart"></span>　擅长领域</p>
							<p class="col-xs-9">我擅长的领域</p>
						</div>
						<div class="row info info2" id="showme_div">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-leaf"></span>　个人简介</p>
							<p class="col-xs-9">我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介</p>
						</div>
						
					</div>
								
				</div>

				<div class="row buy_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;身份信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-tags"></span>　真实姓名</p>
							<p class="col-xs-9" id = "realname">我的真实姓名</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-credit-card"></span>　身份证</p>
							<p class="col-xs-9" id = "personnumber">我的身份证号</p>
						</div>
						<div class="row info info2">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-phone"></span>　手机</p>
							<p class="col-xs-9" id = "telphone">我的手机</p>
						</div>
					</div>		
				</div>

				<div class="row buy_info">
					<div class="col-xs-12 info_div">
						<div class="row info1">
							<p class="col-xs-12 title_person"><span class="glyphicon glyphicon-ok-circle"></span> &nbsp;购物信息</p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-credit-card"></span>　我的订单</p>
							<p class="col-xs-9"><a href="#"><span class="glyphicon glyphicon-hand-right"></span>　查看我的所有订单</a></p>
						</div>
						<div class="row info">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-envelope"></span>　我的消息</p>
							<p class="col-xs-9"><a href="#"><span class="glyphicon glyphicon-hand-right"></span>　查看我的消息</a></p>
						</div>
						<div class="row info info2">
							<p class="col-xs-3 label_t"><span class="glyphicon glyphicon-floppy-disk"></span>　我的银行卡</p>
							<p class="col-xs-9"><a href="#"><span class="glyphicon glyphicon-hand-right"></span>　查看我绑定的银行卡</a></p>
						</div>
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