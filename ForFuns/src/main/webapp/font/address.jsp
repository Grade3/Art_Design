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
	<title>Address</title>
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/address.css">
	<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>

<script type="text/javascript">

function addNewOne(){
	$(".add_hidden_bg").show();
	$(".add_hidden").show();
}

function submitNewOne(){
	$(".add_hidden_bg").hide();
	$(".add_hidden").hide();
}

function remove1(){
	$(".ok_remove_bg").show();
	$(".ok_remove").show();
}

function ok_remove1(){
	$(".ok_remove_bg").hide();
	$(".ok_remove").hide();
}

$(document).ready(function()
{
	var btn_remove_h = $(".add_div").height();
	$(".add_remove").height(btn_remove_h);

	var add_hidden_w = $(".add_new").width();
	$(".add_hidden").width(add_hidden_w);

	var ok_remove_w = $(".add_new").width();
	$(".ok_remove").width(ok_remove_w);
});
 
</script>

</head>

<body>

<a href="javascript:;" class="lanrenzhijia_top"></a>

<div class="container-fluid header">
	<div class="title_bar">
		<p class="back_btn"><span class="glyphicon glyphicon-menu-left partten" aria-hidden="true"></span></p>
		<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&nbsp;&nbsp;我的地址</p>
	</div>
</div>

<div class="container-fluid mainer">
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
	<div class="row add_div">
		<div class="radio add_radio">
  			<label>
    			<input type="radio" name="blankRadio" id="blankRadio1" value="option1">
  			</label>
		</div>
		<div class="add_info">
			<p>收货人：孔日天</p>
			<p>地址：福建省厦门市思明区厦门大学</p>
			<p>电话：15659992000</p>
		</div>
		<div class="add_remove">
			<button onclick="remove1()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>

	<div class="row add_new">
		<button class="new_btn" onclick="addNewOne()"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>&nbsp;&nbsp;新增地址</button>
	</div>

	
</div>

	<div class="row add_hidden_bg"></div>
	<div class="row add_hidden">
		<div class="row add_name">
			<p>收货人：</p>
			<input type="text" class="col-xs-12" />
		</div>
		<div class="row add_name">
			<p>地址：</p>
			<input type="text" class="col-xs-12" />
		</div>
		<div class="row add_name">
			<p>电话：</p>
			<input type="text" class="col-xs-12" />
		</div>
		<div class="row add_name">
			<button class="col-xs-12 new_submit" onclick="submitNewOne()"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;&nbsp;提交</button>
		</div>
	</div>

	<div class="row ok_remove_bg"></div>
	<div class="row ok_remove">
		<p>是确认否删除？</p>
		<button class="col-xs-5 btn_remove" onclick="ok_remove1()">是</button>
		<button class="col-xs-offset-2 col-xs-5 btn_remove" onclick="ok_remove1()">否</button>
	</div>

</body>
</html>