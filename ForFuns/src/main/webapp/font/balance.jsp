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
	<title>Balance</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/balance.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script src="<%=basePath%>js/lanrenzhijia.js"></script>
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

function addNewOne(){
	$(".add_hidden").show();
}

function submitNewOne(){
	$(".add_hidden_bg").show();
	$(".ok_remove").show();
}

function ok_remove1()
{
	$(".add_hidden_bg").hide();
	$(".ok_remove").hide();
	$(".add_hidden").hide();
}

$(document).ready(function()
{
	var pic_w = $(".order_pic").width();
	var pic_h = pic_w;
	$(".order_pic").height(pic_h);
	var add_hidden_w = $(".add_new").width();
	$(".add_hidden").width(add_hidden_w);
	var ok_remove_w = $(".add_new").width();
	$(".ok_remove").width(ok_remove_w);

	$(window).resize(function() {
  		var pic_w = $(".order_pic").width();
		var pic_h = pic_w;
		$(".order_pic").height(pic_h);
		var add_hidden_w = $(".add_new").width();
		$(".add_hidden").width(add_hidden_w);
		var ok_remove_w = $(".add_new").width();
		$(".ok_remove").width(ok_remove_w);
  	});
});
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></span>&nbsp;&nbsp;我的余额</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row order_div">
		<p class="col-xs-8 statue_label"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;当前余额</p>
		<p class="col-xs-4 statue_label now_balance">￥99.00</p>
	</div>
	<div class="row add_new">
		<button class="new_btn" onclick="addNewOne()"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;&nbsp;现在充值</button>
	</div>

</div>
	
	<div class="row add_hidden_bg"></div>
	<div class="row add_hidden">
		<div class="row add_name">
			<p>充值金额：</p>
			<input type="text" class="col-xs-12" />
		</div>
		<div class="row password_error">
			<p><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;&nbsp;充值金额不能为空</p>
		</div>
		<div class="row add_name">
			<button class="col-xs-12 new_submit" onclick="submitNewOne()"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;确认充值</button>
		</div>
	</div>

	<div class="row ok_remove">
		<p>充值成功！</p>
		<button class="col-xs-offset-4 col-xs-4 btn_remove" onclick="ok_remove1()">确定</button>
	</div>

</body>
</html>