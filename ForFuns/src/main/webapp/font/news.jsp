<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Home</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/news.css" rel="stylesheet" type="text/css" />
</head>
<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="<%=basePath%>js/lanrenzhijia.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery-1.4.4.min.js"></script>
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
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}; 
//更改datebox的日期格式
function myformatter(value) {
	//return new Date(parseInt(value)).toLocaleString().replace(/年|月/g, "-")
	//		.replace(/日/g, " ");
	var myDate = new Date(parseInt(value));
	var year = myDate.getFullYear();
	var month = myDate.getMonth() + 1;
	var day = myDate.getDate();
	return year + '-' + month + '-' + day;
}
function GetNewsDetail(newsid){
	$.ajax({
		type:'post',
		url:'<%=basePath%>/news.do?method=getnewsbyid',
		data:{newsid:newsid},
		success:function(json){
			var news = json.news;
			var content = news.content;
			var title = news.title;
			var time = news.timestart;
			time = myformatter(time);
			var author = news.author;
			$('#news_content').html(content);
			$('#news_title').html(title);
			$('#news_time').html("发布时间："+time);
			$('#news_author').html("发布人："+author);
		},error:function(){
			
		}
	});
}
$(document).ready(function(){
	var newsid = getUrlParam("newsid");
	GetNewsDetail(newsid);
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
				<div class="top-nav">
					<ul class="megamenu skyblue">
						<li><a href="home.html">首页</a></li>
						<li><a href="home.html">成品</a></li>
						<li><a href="home.html">DIY</a></li>
						<li><a href="home.html">艺术家</a></li>
						<li><a href="news.html">资讯中心</a></li>
						<li><a href="home.html">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h6 class="location"><a href="home.html">首页</a> <i> </i> <a href="newslist.html">资讯中心</a> <i> </i> 资讯详情</h6>
	</div>
	
	<div class="bar_news">
		<h2>资讯详情</h2>
	</div>

	<div class="content">
		<div class="container">
			<div class="news_title" >
				<p id="news_title">资讯标题</p>
			</div>
			<div class="news_author">
				<span id="news_time">发布时间：2015/11/25 &nbsp;&nbsp; 8：30</span><span id="news_author">发布人：孔日天</span>
			</div>
			<div class="news_content" id="news_content">
				<p>资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容资讯内容。</p>
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
			<div class="col-md-3 footer-left">
				<img src="<%=basePath%>image/Title.png" class="footer_logo">
			</div>
			<div class="col-md-5 footer-middle">
				<h3>关于我们</h3>
				<span>电话：156-5000-9000</span>
				<span class="email">邮箱：471979617@qq.com</span>
				</br>
				<span>地址：福建省厦门市思明区422号厦门大学</span>
			</div>
			<div class="col-md-4 footer-right">
				<h3>友情链接</h3>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a></br>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a>
				<a href="#">友情链接1</a>
			</div>
			<div class="col-md-12">
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.</p>
			</div>			
		</div>
	</div>
</body>
</html>