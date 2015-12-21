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
	<title>OrderList</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/OrderList.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
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
function getUserOrder(customerUserid){
	$.ajax({
		type:'post',
		url:"<%=basePath%>order.do?method=getCustomerOrder",
		data:{customeruserid:customerUserid},
		success:function(json){
			var list = json.list;
			var content = "";
			if(list.length>0){
				for(var i = 0;i<list.length;i++){
					var id= list[i].id;
					var productname = list[i].productname;
					var ispay = list[i].ispay;
					var money = list[i].money;
					var artistname =list[i].artistname;
					content += "<div class='row order_div'><div class='row order_artist'><a href='<%=basePath%>artistHome.jsp?id="+id+"'><p class='col-xs-9 artist_name'><span class='glyphicon glyphicon-link' aria-hidden='true'>"
						+"</span>&nbsp;&nbsp;"+artistname+"&nbsp;&nbsp;<span class='glyphicon glyphicon-menu-right partten1' aria-hidden='true'></span></p></a><p class='col-xs-3 order_statue'>订单状态</p></div>"
						+"<a href='<%=basePath%>OrderDetail.jsp'><div class='row order_info'><img class='col-xs-3 order_pic' src='<%=basePath%>image/good.jpg'><div class='col-xs-9 row order_label'>"
						+"<div class='row label1'><p class='col-xs-8 order_name'>订单商品名称订单商品名称</p><p class='col-xs-4 order_price'>￥99.00</p></div></div></div></a></div>";
				}
				$('#orderlist').html(content);
			}
		},error:function(){
			
		}
		
	});
}
$(document).ready(function(){
	var customerUserid = getCookieUserid();
	getUserOrder(customerUserid);
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
		<p><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;我的订单</p>
	</div>
</div>

<div class="container-fluid mainer" id="orderlist">
	<%-- <div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-9 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
				<p class="col-xs-3 order_statue">订单状态</p>
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
	</div>
	<div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-9 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
				<p class="col-xs-3 order_statue">订单状态</p>
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
	</div>
	<div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-9 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
				<p class="col-xs-3 order_statue">订单状态</p>
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
	</div>
	<div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-9 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
				<p class="col-xs-3 order_statue">订单状态</p>
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
	</div>
	<div class="row order_div">
		<a href="artistHome.html">
			<div class="row order_artist">
				<p class="col-xs-9 artist_name"><span class="glyphicon glyphicon-link" aria-hidden="true"></span>&nbsp;&nbsp;艺术家名称&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right partten1" aria-hidden="true"></span></p>
				<p class="col-xs-3 order_statue">订单状态</p>
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
	</div> --%>
</div>

</body>
</html>