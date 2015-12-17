<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../css/dom.css" rel="stylesheet" type="text/css" />
<link href="../css/footer.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/modify.css">
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
		url:'<%=basePath%>/customer.do?method=getCustomerByUserid',
				data : {
					customerid : id
				},
				success : function(json) {
					var customer = json.customer;
					var userid = customer.userid;
					var username = customer.username;
					var personnumber = customer.personnumber;
					var telphone = customer.telphone;
					var realname = customer.realname;
					var avator = customer.avator;
					var isartist = customer.isartist;

					if (isartist == "0") {
						$('#showme_div').hide();
						$('#advantage_div').hide();
					}

					$('#username').val(username);
					$('#userid').val(userid);
					$('#personnumber').val(personnumber);
					$('#telphone').val(telphone);
					$('#realname').val(realname);
				},
				error : function() {

				}
			});
		}
		
function checkTelphone(telphone)
{
	var strRegex = /[1-9]\d{6,}$/;
	var re = new RegExp(strRegex);
	
	if(!re.test(telphone))
	{
		$("#telphone").focus();
		return false;
	}
	
	return true;
}

function checkPersonnumber(personnum)
{
	var strRegex = /\d{17}(\d|X)$/;
	var re = new RegExp(strRegex);
	
	if(!re.test(personnum))
	{
		$("#personnumber").focus();
		return false;
	}
	
	return true;
}

function validate()
{	
	var userid = $("#userid").val();
	var username = $("#username").val();
	var realname = $("#realname").val();
	var telphone = $("#telphone").val();
	var personnumber = $("#personnumber").val();
	
	if(username == null || username == "" || realname == null || realname == "" || 
			realname == null || realname == "" ||telphone == null || telphone == "")
	{
		alert("信息不完整");
		return false;
	}
	
	if(!checkTelphone(telphone))
	{
		alert("联系方式格式错误");
		return false;
	}
	
	if(!checkPersonnumber(personnumber))
	{
		alert("身份证号码格式错误");
		return false;
	}
	
	return true;
}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#menu").click(function() {
				$("#menu-xs").toggle(300);
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
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
					<li><span><i class="item_message"> </i>471979617@qq.com</span></li>
					<li><span><i class="item_tel"> </i>156-9000-8000</span></li>
				</ul>
				<ul class="support-right">
					<li><a href="Login.html"><i class="item_login"> </i>登陆</a></li>
					<li><a href="Register.html"><i class="item_register">
						</i>注册账号</a></li>
				</ul>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="home.html">ArtCustomize</a>
					</h1>
				</div>
				<div class="top-nav visible-xs visible-sm">
					<ul class="megamenu skyblue">
						<li><a href="home.jsp" class="menu_home"><span
								class="glyphicon glyphicon-home" aria-hidden="true"></span></br>首页</a></li>
						<li><a href="goodslist.jsp"><span
								class="glyphicon glyphicon-tower" aria-hidden="true"></span></br>成品</a></li>
						<li><a href="home.html"><span
								class="glyphicon glyphicon-tags" aria-hidden="true"></span></br>DIY</a></li>
						<li><a href="artistlist.jsp"><span
								class="glyphicon glyphicon-camera" aria-hidden="true"></span></br>艺术家</a></li>
						<li><a href="newslist.jsp"><span
								class="glyphicon glyphicon-comment" aria-hidden="true"></span></br>资讯中心</a></li>
						<li><a href="home.html"><span
								class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span></br>联系我们</a></li>
					</ul>
				</div>
				<div class="top-nav-xs visible-md">
					<div id="menu">
						<p>菜 单</p>
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
		<h6 class="location">
			<a href="home.html">首页</a> <i> </i> <a href="personal.html">个人中心</a>
			<i> </i> 修改个人信息
		</h6>
	</div>


	<div class="bar_news">
		<h2>修改个人信息</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="main_up">
				<div class="user_info">
					<img class="userpic" src="../image/bl.jpg" id="avator">
					<p class="picture">
						<a href="modifyPassword.html">更换头像</a>
					</p>
				</div>
			</div>


			<div class="main-mid">
				<form
					action="${pageContext.request.contextPath}/customer.do?method=alertcustomer"
					method="post">
					<div class="row person_info">
						<div class="col-xs-12 info_div">
							<div class="row info1">
								<p class="col-xs-12 title_person">
									<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;账号信息
								</p>
							</div>
							<div class="row info">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-user"></span> 用户名
								</p>
								<input type="text" class="col-xs-8" name = "userid" value="我的用户名" id="userid" readonly="readonly">
							</div>
							<div class="row info">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-user"></span> 昵称
								</p>
								<input type="text" class="col-xs-8" value="我的昵称" name = "username" id="username">
							</div>
							<div class="row info" id="advantage_div">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-heart"></span> 擅长领域
								</p>
								<input type="text" class="col-xs-8" value="我擅长的领域"
									id="advantage" name = "advantage">
							</div>
							<div class="row info info2" id="showme_div">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-leaf"></span> 个人简介
								</p>
								<textarea class="col-xs-8" id="showme" name = "showme">我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介我的个人简介</textarea>
							</div>

						</div>

					</div>

					<div class="row buy_info">
						<div class="col-xs-12 info_div">
							<div class="row info1">
								<p class="col-xs-12 title_person">
									<span class="glyphicon glyphicon-ok-circle"></span> &nbsp;身份信息
								</p>
							</div>
							<div class="row info">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-tags"></span> 真实姓名
								</p>
								<input type="text" class="col-xs-8" value="我的真实姓名" id="realname" name="realname">
							</div>
							<div class="row info">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-credit-card"></span> 身份证
								</p>
								<input type="text" class="col-xs-8" value="我的真身份证号"
									id="personnumber" name="personnumber">
							</div>
							<div class="row info info2">
								<p class="col-xs-3 label_t">
									<span class="glyphicon glyphicon-phone"></span> 手机
								</p>
								<input type="text" class="col-xs-8" value="我的手机" id="telphone" name="telphone">
							</div>
						</div>

						<div class="col-xs-12 success_btn visible-lg">
							<input type="submit" class="col-xs-offset-2 col-xs-8"
								value="提交修改" onclick="return validate()">
						</div>

						<div class="col-xs-12 success_btn hidden-lg">
							<input type="submit" class="col-xs-12" value="提交修改" onclick="return validate()">
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>

	<div class="bottom-grid1">
		<div class="fit1">
			<h3>HAPPY SHOPPING</h3>
			<p>Lorem Ipsum sit amet consectuer adipiscing elitsed diam
				nonummy nibh euismod</p>
		</div>
	</div>



	<div class="footer">
		<div class="container footer-div">
			<div class="col-md-12 footer-middle">
				<p>公司简介：这里是公司简介公司简介公司简介公司简介公司简介公司简介</p>
				<p>地址：福建省厦门市思明区422号厦门大学</p>
			</div>
			<div class="col-md-12 company">
				<p class="footer-class">Copyright &copy; 2015.Company name All
					rights reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>