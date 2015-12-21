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
	<title>OrderDetail</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/OrderDetail.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>

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
	var pic_w = $(".order_pic").width();
	var pic_h = pic_w;
	$(".order_pic").height(pic_h);

	$(window).resize(function() {
  		var pic_w = $(".order_pic").width();
		var pic_h = pic_w;
		$(".order_pic").height(pic_h);
  	});
});
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单详情</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row statue_detail">
		<p class="col-xs-12 statue_label"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单状态</p>
		<p class="statue_price">订单金额（含运费）：￥99.00</p>
		<p class="statue_price">运费：￥10.00</p>
	</div>
	<div class="row receiver">
		<p class="col-xs-12 receiver_name"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;&nbsp;收货人：孔日天</p>
		<p class="receiver_add">收货地址：福建省厦门市思明区厦大学生公寓</p>
		<p class="receiver_add">联系电话：15699990000</p>
	</div>
	<div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-12 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
			</div>
		</a>
		<a href="OrderDetail.html">
			<div class="row order_info">
				<img class="col-xs-3 order_pic" src="../image/good.jpg">
				<div class="col-xs-9 row order_label">
					<div class="row label1">
						<p class="col-xs-8 order_name">订单商品名称订单商品名称</p>
						<p class="col-xs-4 order_price">￥99.00</p>
					</div>
				</div>
			</div>
		</a>
		<div class="row order_sth">
			<p class="col-xs-12 order_id">订单号：1234567890</p>
			<p class="col-xs-12 order_time">成交时间：2015-12-21 14:20:53</p>
		</div>
		<div class="row order_btn">
			<button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button>
			<button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button>
		</div>
	</div>
</div>

</body>
</html>