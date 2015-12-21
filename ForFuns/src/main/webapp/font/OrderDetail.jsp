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
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/OrderDetail.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
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
				location.href="<%=basePath%>font/Login.jsp";
			}else if(json==3){
				location.href="<%=basePath%>font/error.jsp";
				//跳转到错误页面
			}else if(json==2){
				//相符则为修改页面
				
			}
		},error:function(){
			
		}
	});
}
function getOderDetail(id){
	$.ajax({
		type:'post',
		url:'<%=basePath%>order.do?method=GetOrderByid',
		data:{id:id},
		success:function(json){
			var order = json.order;
			var id =order.id;
			var telephone = order.telephone;
			var address = order.address;
			var current = order.current;
			var ispay = order.ispay;
			var productname = order.productname;
			
		},error:function(){
			
		}
	});
}
$(document).ready(function()
{
	var productid = getUrlParam("id");
	if(productid==null){
		location.href="404.jsp";
	}
	checkOrder(productid);
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


<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单详情</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row statue_detail">
		<p class="col-xs-12 statue_label"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;订单状态</p>
		<p class="statue_price" id="money">订单金额（含运费）：￥99.00</p>
		<!-- <p class="statue_price">运费：￥10.00</p> -->
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
				<img class="col-xs-3 order_pic" src="<%=basePath%>image/good.jpg">
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
			<p class="col-xs-12 order_time">下单时间：2015-12-21 14:20:53</p>
		</div>
		<div class="row order_btn">
			<button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button>
			<button class="col-xs-4 btn btn-default" type="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;&nbsp;删除订单</button>
		</div>
	</div>
</div>

</body>
</html>