<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<title>Newslist</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />	
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link href="../css/newslist.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	*{font-style: normal;}
</style>
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
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};
//检测用户是否已登录
function CheckUser(){
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	$.ajax({
		type:'post',
		asycn:false,
		url:'<%=basePath%>customer.do?method=GetCustomerName',
		data:{customerid:id},
		success:function(json){
			$('#registeraction').hide();
			$('#loginaction').hide();
			$('#usernameaction').show();
			$('#loginoutaction').show();
			$('#username').html("<i class='item_login'/>"+json);
		},error:function(){
			
		}
	});
}
//获取上线新闻
function GetNewsList(page,pageSize){
	$.ajax({
		type:'post',
		url:'<%=basePath%>news.do?method=GetOnlineNews',
		data:{page:page,pageSize:pageSize},
		success:function(json){
			var list = json.list;
			var total = json.total;
			globaltotal = total;
			if(list.length>0){
				var body = "";
				for(var i=0;i<list.length;i++){
					var imgurl = list[i].imgurl;
					var title = list[i].title;
					var summary = list[i].summary;
					var id= list[i].id;
					var content = "<div class='col-md-12 blog-in-top'><div><div class='col-md-4 van'><a href='news.jsp?newsid="+id+"'><img src='"+imgurl+"' class='img-responsive news_pic' /></a></div><div class='col-md-8 on-para'><div class='col-on'><h4>"+title+"</h4><span>2015/11/25&nbsp;&nbsp;8:30</span></div><p>"+summary+"</p><a href='news.jsp?newsid="+id+"' class='sed'>Readmore</a></div></div></div>";
					body += content;
				}
				if(page*pageSize <globaltotal){
					body +="<div class='col-md-12 blog-in-top'><div class='learn_more'><p>查看更多</p></div></div>";
				}
				$('#newslist').append(body);
			}else{
				var content ="<div class='col-md-12 blog-in-top'><div class='learn_more'><p>没有更多的信息</p></div></div>";
				$('#newslist').html(content);
			}
		},error:function(){
			
		}
	});
}
$(document).ready(function(){
  $('#usernameaction').hide();
  $('#loginoutaction').hide();
  CheckUser();
  var page = 1;
  var pageSize = 3;
  var globaltotal = 0;
  $("#menu").click(function(){
  	$("#menu-xs").toggle(300);
  });
  GetNewsList(page,pageSize);
  $('.learn_more').live('click',function(){
		 page = page +1 ;
		 GetNewsList(page,pageSize);
		 $(this).parent().hide();
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
						<li id="loginaction" ><a href="Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li id="registeraction"><a href="Register.jsp" ><i class="item_register"> </i>注册账号</a></li>
						<li id="usernameaction"><a href="javascrip:void(0);" id="username"><i class="item_login"/>登陆</a></li>
						<li id="loginoutaction"><a href="Login.jsp" ><i class="item_register"> </i>退出</a></li>			
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
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 资讯中心 </h6>
	</div>
	
	<div class="bar_news">
		<h2>资讯中心</h2>
	</div>

	<div class="content">
		<div class="container" id="newslist">
			<!-- <div class="col-md-12 blog-in-top">
				<div>
					<div class="col-md-4 van">
						<a href="news.jsp">
							<img src="../image/bl.jpg" class="img-responsive news_pic" alt=""/>
						</a>
					</div>
					<div class="col-md-8 on-para">
						<div class="col-on">
							<h4>这里是资讯标题</h4>
							<span>2015/11/25&nbsp;&nbsp;8:30</span>
						</div>
						<p>这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要...</p>
						<a href="news.jsp" class="sed">Readmore</a>
					</div>
				</div>
			</div>
			<div class="col-md-12 blog-in-top">
				<div>
					<div class="col-md-4 van">
						<a href="news.jsp">
							<img src="../image/bl.jpg" class="img-responsive news_pic" alt=""/>
						</a>
					</div>
					<div class="col-md-8 on-para">
						<div class="col-on">
							<h4>这里是资讯标题</h4>
							<span>2015/11/25&nbsp;&nbsp;8:30</span>
						</div>
						<p>这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要...</p>
						<a href="news.jsp" class="sed">Readmore</a>
					</div>
				</div>
			</div>
			<div class="col-md-12 blog-in-top">
				<div>
					<div class="col-md-4 van">
						<a href="news.jsp">
							<img src="../image/bl.jpg" class="img-responsive news_pic" alt=""/>
						</a>
					</div>
					<div class="col-md-8 on-para">
						<div class="col-on">
							<h4>这里是资讯标题</h4>
							<span>2015/11/25&nbsp;&nbsp;8:30</span>
						</div>
						<p>这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要这里是资讯摘要...</p>
						<a href="news.jsp" class="sed">Readmore</a>
					</div>
				</div>
			</div> 
			<div class="col-md-12 blog-in-top">
				<div class="learn_more">
					<p>查看更多</p>
				</div>
			</div>
			-->
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