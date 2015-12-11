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
<title>Register</title>
<link rel="shortcut icon"
	href="http://static.hdslb.com/images/favicon.ico">
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/footer.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/Register.css">
</head>
<body>

	<a href="javascript:;" class="lanrenzhijia_top"></a>
	<script src="../js/lanrenzhijia.js"></script>
	<script>
	function getUrlParam(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	    if (r != null) return unescape(r[2]); return null; //返回参数值
	};  
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
  	$("#menu").click(function()
	{
  		$("#menu-xs").toggle(300);
  	});
  	
  	var error = getUrlParam("error");
  	if(error==3)
  	{
  		$('#errormessage2').show();
  		$("#userid").focus();
  		return false;
  	}
});

function checkUserid(userid)
{	  
	 if(userid.length > 18)
	 {
	  	$("#errormessage3").show();
	  	$("#userid").focus();
	 	return false;
	 }
	 else
	 {
		var strRegex = /^[a-zA-Z]{1}[0-9a-zA-Z_]{1,}$/;
		var re=new RegExp(strRegex);
	    if(!re.test(userid))
	    {
	    	$('#errormessage4').show();
	    	$("#userid").focus();
			return false;
	    }
	 }
    return true;
}

function checkTelphone(telphone)
{
	var strRegex = /[0-9]/;
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
	for(var i = 0; i < 7; i++)
	{
		var str = '#errormessage' + i;
		$(str).hide();
	}
	
	var userid = $("#userid").val();
	var username = $("#username").val();
	var password = $("#password").val();
	var confirm_password = $("#confirm_password").val();
	var realname = $("#realname").val();
	var telphone = $("#telphone").val();
	var personnumber = $("#personnumber").val();
	
	if(userid == null || userid == "" || username == null || username == "" || password == null || password == "" 
			|| confirm_password == null || confirm_password == "" || realname == null || realname == "" || 
			realname == null || realname == "" ||telphone == null || telphone == "")
	{
		$('#errormessage1').show();
		return false;
	}
	
	if(!checkUserid(userid))
	{
		return false;
	}
	
	if(password != confirm_password)
	{
		$('#errormessage5').show();
		return false;
	}
	
	if(!checkTelphone(telphone))
	{
		$('#errormessage6').show();
		return false;
	}
	
	if(!checkPersonnumber(personnumber))
	{
		$('#errormessage7').show();
		return false;
	}
	
	$('#success').show();
	return true;
}
</script>


	<div class="header-top">
		<div class="container">
			<div class="statu_bar">
				<ul class="support">
					<li><span><i class="item_message"> </i>471979617@qq.com</span></li>
					<li><span><i class="item_tel"> </i>156-9000-8000</span></li>
				</ul>
				<ul class="support-right">
					<li><a href="Login.jsp"><i class="item_login"> </i>登陆</a></li>
					<li><a href="Register.jsp"><i class="item_register">
						</i>注册账号</a></li>
				</ul>
			</div>
		</div>
		<div class="header-bottom">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="home.jsp">ArtCustomize</a>
					</h1>
				</div>
				<div class="top-nav-xs hidden-lg">
					<div id="menu" onmouseover="fun1();" onmouseout="fun2();">
						<p>菜 单</p>
					</div>
					<div id="menu-xs">
						<ul>
							<li><a href="home.jsp">首页</a></li>
							<li><a href="home.jsp">成品</a></li>
							<li><a href="home.jsp">DIY</a></li>
							<li><a href="home.jsp">艺术家</a></li>
							<li><a href="newslist.jsp">资讯中心</a></li>
							<li><a href="home.jsp">联系我们</a></li>
						</ul>
					</div>
				</div>
				<div class="top-nav visible-lg">
					<ul class="megamenu skyblue">
						<li><a href="home.jsp">首页</a></li>
						<li><a href="home.jsp">成品</a></li>
						<li><a href="home.jsp">DIY</a></li>
						<li><a href="home.jsp">艺术家</a></li>
						<li><a href="newslist.jsp">资讯中心</a></li>
						<li><a href="home.jsp">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h6 class="location">
			<a href="home.jsp">首页</a> <i> </i> 注册
		</h6>
	</div>


	<div class="bar_news">
		<h2>注册账号</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-sm-offset-2 col-md-8 visible-md visible-lg">
				<form
					action="${pageContext.request.contextPath}/customer.do?method=register"
					method="post">
					<div class="form-group">
						<label for="inputEmail3"
							class="col-sm-2 control-label label_login">用户名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="userid" id="userid"
								class="form-control inputSth" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="password" id="password"
								class="form-control inputSth" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">确认密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="confirm_password"
								id="confirm_password" class="form-control inputSth"
								placeholder="请再次输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">昵称</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="username" id="username"
								class="form-control inputSth" placeholder="请输入昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">真实姓名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="realname" id="realname"
								class="form-control inputSth" placeholder="请输入真实姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">身份证</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="personnumber" id="personnumber"
								class="form-control inputSth" placeholder="请输入二代身份证号">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">手机</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="telphone" id="telphone"
								class="form-control inputSth" placeholder="请输入手机号码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<button type="submit" class="btn btn-default col-sm-12"
								id="btn_login" onclick="return validate()">注册</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<p class="label_error1" id="errormessage1" style="display:none;">输入信息不完整！</p>
							<p class="label_error1" id="errormessage2" style="display:none;">用户名已被注册！</p>
							<p class="label_error1" id="errormessage3" style="display:none;">用户名长度不对,应为5到18个字符</p>
							<p class="label_error1" id="errormessage4" style="display:none;">用户名应包括字母、数字和下划线，以字母开头</p>
							<p class="label_error" id="errormessage5" style="display:none;">两次密码不一致！</p>
							<p class="label_error1" id="errormessage6" style="display:none;">手机号格式错误！</p>
							<p class="label_error" id="errormessage7" style="display:none;">身份证格式错误！</p>
							<div class="success" id="success" hidden="true">
								<img src="../image/success_pic.png">
								<p>注册成功</p>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div class="col-md-8 visible-sm visible-xs">
				<form
					action="${pageContext.request.contextPath}/customer.do?method=register"
					method="post">
					<div class="form-group">
						<label for="inputEmail3"
							class="col-sm-2 control-label label_login">用户名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="userid" id="userid" class="form-control inputSth"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" 
							class="col-sm-2 control-label label_login">密码</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="password" id="password" class="form-control inputSth"
								placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" 
							class="col-sm-2 control-label label_login">确认密码</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="confirm_password" id="confirm_password"
								class="form-control inputSth" placeholder="请再次输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">昵称</label>
						<div class="col-sm-10 input_div">
							<input type="text" id="username" name="username" class="form-control inputSth"
								placeholder="请输入昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">真实姓名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="realname" id="realname" class="form-control inputSth"
								placeholder="请输入真实姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">身份证</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="personnumber" id="personnumber"
								class="form-control inputSth" placeholder="请输入二代身份证号">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">手机</label>
						<div class="col-sm-10 input_div">
							<input type="text" id="telphone" name="telphone" class="form-control inputSth"
								placeholder="请输入手机号码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<button type="submit" class="btn btn-default col-sm-12"
								id="btn_login">注册</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<p class="label_error1" id="errormessage1" style="display:none;">输入信息不完整！</p>
							<p class="label_error1" id="errormessage2" style="display:none;">用户名已被注册！</p>
							<p class="label_error1" id="errormessage3" style="display:none;">用户名长度不对,应为5到18个字符</p>
							<p class="label_error1" id="errormessage4" style="display:none;">用户名应包括字母、数字和下划线，以字母开头</p>
							<p class="label_error" id="errormessage5" style="display:none;">两次密码不一致！</p>
							<p class="label_error1" id="errormessage6" style="display:none;">手机号格式错误！</p>
							<p class="label_error" id="errormessage7" style="display:none;">身份证格式错误！</p>
							<div class="success" id="success" hidden="true">
								<img src="../image/success_pic.png">
								<p>注册成功</p>
							</div>
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