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
  		$('#errormessage12').show();
  		$("#userid1").focus();
  		$('#errormessage22').show();
  		$("#userid2").focus();
  		return false;
  	}
});

function checkUserid(userid)
{	  
	 if(userid.length > 18)
	 {
	  	$("#errormessage13").show();
	  	$("#userid1").focus();
	  	$("#errormessage23").show();
	  	$("#userid2").focus();
	 	return false;
	 }
	 else
	 {
		var strRegex = /^[a-zA-Z]{1}[0-9a-zA-Z_]{1,}$/;
		var re=new RegExp(strRegex);
	    if(!re.test(userid))
	    {
	    	$('#errormessage14').show();
	    	$('#errormessage24').show();
	    	$("#userid1").focus();
	    	$("#userid2").focus();
			return false;
	    }
	 }
    return true;
}

function checkTelphone(telphone)
{
	var strRegex = /[1-9]\d{6,}$/;
	var re = new RegExp(strRegex);
	
	if(!re.test(telphone))
	{
		$("#telphone1").focus();
		$("#telphone2").focus();
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
		$("#personnumber1").focus();
		$("#personnumber2").focus();
		return false;
	}
	
	return true;
}

function validate1()
{
	for(var i = 0; i < 7; i++)
	{
		var str = '#errormessage1' + i;
		$(str).hide();
	}
	
	var userid = $("#userid1").val();
	var username = $("#username1").val();
	var password = $("#password1").val();
	var confirm_password = $("#confirm_password1").val();
	var realname = $("#realname1").val();
	var telphone = $("#telphone1").val();
	var personnumber = $("#personnumber1").val();
	
	if(userid == null || userid == "" || username == null || username == "" || password == null || password == "" 
			|| confirm_password == null || confirm_password == "" || realname == null || realname == "" || 
			realname == null || realname == "" ||telphone == null || telphone == "")
	{
		$('#errormessage11').show();
		return false;
	}
	
	if(!checkUserid(userid))
	{
		return false;
	}
	
	if(password != confirm_password)
	{
		$('#errormessage15').show();
		return false;
	}
	
	if(!checkTelphone(telphone))
	{
		$('#errormessage16').show();
		return false;
	}
	
	if(!checkPersonnumber(personnumber))
	{
		$('#errormessage17').show();
		return false;
	}
	
	$('#success1').show();
	return true;
}

function validate2()
{
	for(var i = 0; i < 7; i++)
	{
		var str = '#errormessage2' + i;
		$(str).hide();
	}
	
	var userid = $("#userid2").val();
	var username = $("#username2").val();
	var password = $("#password2").val();
	var confirm_password = $("#confirm_password2").val();
	var realname = $("#realname2").val();
	var telphone = $("#telphone2").val();
	var personnumber = $("#personnumber2").val();
	
	if(userid == null || userid == "" || username == null || username == "" || password == null || password == "" 
			|| confirm_password == null || confirm_password == "" || realname == null || realname == "" || 
			realname == null || realname == "" ||telphone == null || telphone == "")
	{
		$('#errormessage21').show();
		return false;
	}
	
	if(!checkUserid(userid))
	{
		return false;
	}
	
	if(password != confirm_password)
	{
		$('#errormessage25').show();
		return false;
	}
	
	if(!checkTelphone(telphone))
	{
		$('#errormessage26').show();
		return false;
	}
	
	if(!checkPersonnumber(personnumber))
	{
		$('#errormessage27').show();
		return false;
	}
	
	$('#success2').show();
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
							<input type="text" name="userid" id="userid1"
								class="form-control inputSth" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="password" id="password1"
								class="form-control inputSth" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">确认密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="confirm_password"
								id="confirm_password1" class="form-control inputSth"
								placeholder="请再次输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">昵称</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="username" id="username1"
								class="form-control inputSth" placeholder="请输入昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">真实姓名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="realname" id="realname1"
								class="form-control inputSth" placeholder="请输入真实姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">身份证</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="personnumber" id="personnumber1"
								class="form-control inputSth" placeholder="请输入二代身份证号">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">手机</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="telphone" id="telphone1"
								class="form-control inputSth" placeholder="请输入手机号码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<button type="submit" class="btn btn-default col-sm-12"
								id="btn_login" onclick="return validate1()">注册</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<p class="label_error1" id="errormessage11" style="display:none;">输入信息不完整！</p>
							<p class="label_error1" id="errormessage12" style="display:none;">用户名已被注册！</p>
							<p class="label_error1" id="errormessage13" style="display:none;">用户名长度不对,应为5到18个字符</p>
							<p class="label_error1" id="errormessage14" style="display:none;">用户名应包括字母、数字和下划线，以字母开头</p>
							<p class="label_error" id="errormessage15" style="display:none;">两次密码不一致！</p>
							<p class="label_error1" id="errormessage16" style="display:none;">手机号格式错误！</p>
							<p class="label_error" id="errormessage17" style="display:none;">身份证格式错误！</p>
							<div class="success" id="success1" hidden="true">
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
							<input type="text" name="userid" id="userid2" class="form-control inputSth"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" 
							class="col-sm-2 control-label label_login">密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="password" id="password2" class="form-control inputSth"
								placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" 
							class="col-sm-2 control-label label_login">确认密码</label>
						<div class="col-sm-10 input_div">
							<input type="password" name="confirm_password" id="confirm_password2"
								class="form-control inputSth" placeholder="请再次输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">昵称</label>
						<div class="col-sm-10 input_div">
							<input type="text" id="username2" name="username" class="form-control inputSth"
								placeholder="请输入昵称">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">真实姓名</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="realname" id="realname2" class="form-control inputSth"
								placeholder="请输入真实姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">身份证</label>
						<div class="col-sm-10 input_div">
							<input type="text" name="personnumber" id="personnumber2"
								class="form-control inputSth" placeholder="请输入二代身份证号">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 control-label label_login">手机</label>
						<div class="col-sm-10 input_div">
							<input type="text" id="telphone2" name="telphone" class="form-control inputSth"
								placeholder="请输入手机号码">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<button type="submit" class="btn btn-default col-sm-12"
								id="btn_login" onclick="return validate2()">注册</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 input_div">
							<p class="label_error1" id="errormessage21" style="display:none;">输入信息不完整！</p>
							<p class="label_error1" id="errormessage22" style="display:none;">用户名已被注册！</p>
							<p class="label_error1" id="errormessage23" style="display:none;">用户名长度不对,应为5到18个字符</p>
							<p class="label_error1" id="errormessage24" style="display:none;">用户名应包括字母、数字和下划线，以字母开头</p>
							<p class="label_error" id="errormessage25" style="display:none;">两次密码不一致！</p>
							<p class="label_error1" id="errormessage26" style="display:none;">手机号格式错误！</p>
							<p class="label_error" id="errormessage27" style="display:none;">身份证格式错误！</p>
							<div class="success" id="success2" hidden="true">
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