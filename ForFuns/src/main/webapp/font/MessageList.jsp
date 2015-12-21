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
	<title>MessageList</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/MessageList.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>

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
$(document).ready(function()
{
	var photo_w = $(".message_photo").width();
	var photo_h = photo_w;
	$(".message_photo").height(photo_h);

	var label_h = $(".message_photo").height();
	$(".message_label").height(label_h);

	var num_h = $(".message_photo").height();
	$(".num_message").height(num_h);

	var circle_h = $(".circle_num").width();
	$(".circle_num").height(circle_h);

	$(window).resize(function() {
		var photo_w = $(".message_photo").width();
		var photo_h = photo_w;
		$(".message_photo").height(photo_h);

		var label_h = $(".message_photo").height();
		$(".message_label").height(label_h);

		var num_h = $(".message_photo").height();
		$(".num_message").height(num_h);

		var circle_h = $(".circle_num").width();
		$(".circle_num").height(circle_h);
  	});
});
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;我的消息</p>
	</div>
</div>

<div class="container-fluid mainer">
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>
<a href="message.html">
	<div class="row message_div">
		<img class="col-xs-3 message_photo" src="../image/good.jpg">
		<div class="col-xs-9 row message_label">
			<div class="col-xs-12 row label1">
				<p class="col-xs-10 send_message">发送者用户名</p>
				<p class="col-xs-2 send_time">08:30</p>
			</div>	
			<div class="col-xs-12 row label1">
				<p class="col-xs-11 new_message">这是一条最新消息</p>
				<div class="col-xs-1 num_message">
					<div class="circle_num">
						<p>3</p>
					</div>
				</div>			
			</div>
		</div>
	</div>
</a>

</div>

</body>
</html>