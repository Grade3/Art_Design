<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
	<!--[if It IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<title>Home</title>
	<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
	<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/dom.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/home.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		function a1_f1() {
            document.getElementById("detail_a1").style.display = "none";
        }
        function a1_f2() {
            document.getElementById("detail_a1").style.display = "block";
        }
        function a2_f1() {
            document.getElementById("detail_a2").style.display = "none";
        }
        function a2_f2() {
            document.getElementById("detail_a2").style.display = "block";
        }
        function a3_f1() {
            document.getElementById("detail_a3").style.display = "none";
        }
        function a3_f2() {
            document.getElementById("detail_a3").style.display = "block";
        }

        function b1_f1() {
            document.getElementById("detail_b1").style.display = "none";
        }
        function b1_f2() {
            document.getElementById("detail_b1").style.display = "block";
        }
        function b2_f1() {
            document.getElementById("detail_b2").style.display = "none";
        }
        function b2_f2() {
            document.getElementById("detail_b2").style.display = "block";
        }
        function b3_f1() {
            document.getElementById("detail_b3").style.display = "none";
        }
        function b3_f2() {
            document.getElementById("detail_b3").style.display = "block";
        }

        function c1_f1() {
            document.getElementById("detail_c1").style.display = "none";
        }
        function c1_f2() {
            document.getElementById("detail_c1").style.display = "block";
        }
        function c2_f1() {
            document.getElementById("detail_c2").style.display = "none";
        }
        function c2_f2() {
            document.getElementById("detail_c2").style.display = "block";
        }
        function c3_f1() {
            document.getElementById("detail_c3").style.display = "none";
        }
        function c3_f2() {
            document.getElementById("detail_c3").style.display = "block";
        }
	</script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
<style type="text/css">
	.item_pic{width:100%;}
	*{font-style: normal;}
</style>
</head>
<body>
<a href="javascript:;" class="lanrenzhijia_top"></a>
<script src="../js/lanrenzhijia.js"></script>
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
$(document).ready(function(){
  $("#menu").click(function(){
  $("#menu-xs").toggle(300);
  });
});
</script>

<script type="text/javascript">
//获取cookie
function getCookie(objName){//获取指定名称的cookie的值 
	var arrStr = document.cookie.split("; "); 
	for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
	} 
};
//检测用户是否已登录
function CheckUser(){
	var useridtoken = getCookie("useridtoken");
	if(null==useridtoken || "" == useridtoken){
		return ;
	}
	var index = useridtoken.indexOf("&");
	var id =  useridtoken.substring(0,index);
	$.ajax({
		type:'post',
		url:'<%=basePath%>customer.do?method=GetCustomerName',
		data:{customerid:id},
		success:function(json){
			$('#registeraction').hide();
			$('#loginaction').hide();
			$('#usernameaction').show();
			$('#loginoutaction').show();
			$('#username').html("<i class='item_login'/>"+json);
		},error:function(){
			
		}
	});
}
//获取热点新闻
function GetHotNews(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>news.do?method=GetHotNew',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				var point = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var imgurl = json[i].imgurl;
					var summary = json[i].summary;
					var title = json[i].title;
					if(i==0){
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+" class='active'></li>";
						body += "<div class='item active'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}else{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+"></li>";
						body += "<div class='item'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					
				}
				$('#banner').html(body);
				$('#bannerpoint').html(point);
			}
		},error:function(){
				
		}
	});
}

//获取第1栏广告
function GetFirstAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetFirstAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				var point = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var imgurl = json[i].imgurl;
					var summary = json[i].summary;
					var title = json[i].title;
					if(i==0)
					{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+" class='active'></li>";
						body += "<div class='item active'><a href='<%=basePath%>font/advert.jsp?advertid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					else
					{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+"></li>";
						body += "<div class='item'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					
				}
				$('#banner').html(body);
				$('#bannerpoint').html(point);
			}
		},error:function(){
				
		}
	});
}

//获取第2栏广告
function GetSecondAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetSecondAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				var point = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var imgurl = json[i].imgurl;
					var summary = json[i].summary;
					var title = json[i].title;
					if(i==0){
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+" class='active'></li>";
						body += "<div class='item active'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}else{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+"></li>";
						body += "<div class='item'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					
				}
				$('#banner').html(body);
				$('#bannerpoint').html(point);
			}
		},error:function(){
				
		}
	});
}

//获取第3栏广告
function GetThirdAdvert(){
	$.ajax({
		type:'post',
		async:false,
		url:'<%=basePath%>advert.do?method=GetThirdAdvert',
		data:{},
		success:function(json){
			if(json.length>0){
				var body = "";
				var point = "";
				for(var i=0;i<json.length;i++){
					var id = json[i].id;
					var imgurl = json[i].imgurl;
					var summary = json[i].summary;
					var title = json[i].title;
					if(i==0){
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+" class='active'></li>";
						body += "<div class='item active'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}else{
						point +="<li data-target='#carousel-example-generic' data-slide-to="+i+"></li>";
						body += "<div class='item'><a href='<%=basePath%>font/news.jsp?newsid="+id+"'><img class='item_pic' src='"+imgurl+"' alt='...' "+"onerror=\"javascript:this.src=\'../image/bg_scroll1.jpg\';\""+"><div class='carousel-caption'><h3>"+title+"</h3><p>"+summary+"</p></div></a></div>";
					}
					
				}
				$('#banner').html(body);
				$('#bannerpoint').html(point);
			}
		},error:function(){
				
		}
	});
}

$(document).ready(function(){
	$('#usernameaction').hide();
	$('#loginoutaction').hide();
	CheckUser();
	GetHotNews();
	GetFirstAdvert();
	GetSecondAdvert();
	GetThirdAdvert();
	var width = $(".carousel-inner").width();
		var height = $(".carousel-inner").width()/5*2.4;
  		$(".item_pic").width(width);
		$(".item_pic").height(height);
		$(".item").height(height);	
  		$(".carousel-inner").height(height);
  		$(".carousel-control").height(height);

  		var artist_h = $(".class75").height();
  		$(".class25").height(artist_h);

  	$(window).resize(function() {
  		var width = $(".carousel-inner").width();
		var height = $(".carousel-inner").width()/5*2.4;
  		$(".item_pic").width(width);
		$(".item_pic").height(height);
		$(".item").height(height);	
  		$(".carousel-inner").height(height);
  		$(".carousel-control").height(height);
  		
  		var artist_h = $(".class75").height();
  		$(".class25").height(artist_h);
  	});
  	
  	
  	$('#username').live('click',function(){
  		var useridtoken = getCookie("useridtoken");
  		var useridtoken = getCookie("useridtoken");
  		if(null==useridtoken || "" == useridtoken){
  			return ;
  		}
  		var index = useridtoken.indexOf("&");
  		var id =  useridtoken.substring(0,index);
  		var address = "<%=basePath%>font/personal.jsp?id=";
  		location.href=address+id;
  	});
});
</script>

	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="statu_bar">
					<ul class="support hidden-xs">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li id="loginaction" ><a href="Login.jsp" ><i class="item_login"> </i>登陆</a></li>
						<li id="registeraction"><a href="Register.jsp" ><i class="item_register"> </i>注册账号</a></li>
						<li id="usernameaction"><a href="#" id="username"><i class="item_login"/></a></li>
						<li id="loginoutaction"><a href="Login.jsp" ><i class="item_register"> </i>退出</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.jsp">ArtCustomize</a></h1>
					</div>
					<div class="top-nav-xs hidden-lg">
						<div id="menu" onmouseover="fun1();" onmouseout="fun2();">
							<p>菜  单</p>
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
		<div>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators" id="bannerpoint">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" id="banner">
    <div class="item active">
      <a href="http://www.baidu.com">
	      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
	      <div class="carousel-caption">
	      	<h3>这里是标题一</h3>
	    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
	      </div>
      </a>
    </div>
    <div class="item">
    	<a href="http://www.baidu.com">
	      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
	      <div class="carousel-caption">
	      	<h3>这里是标题二</h3>
	    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
	      </div>
	    </a>
    </div>
    <div class="item">
      <img class="item_pic" src="<%=basePath%>image/bg_login.jpg" alt="...">
      <div class="carousel-caption">
      	<h3>这里是标题三</h3>
    	<p>这里是资讯描述资讯描述资讯描述资讯描述</p>
      </div>
    </div>
  </div>


  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>



	</div>
	<div class="content">
		<div class="container">
			<div class="content-top visible-lg">
				<div class="col-md-9">
					<div class="col-top">
						<div class="col-md-6 black">
							<a href="Arts.html">
								<div class="arts">
									<h3>艺术品成品</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/arts_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>
						<div class="col-md-6 black-in">
							<a href="DIY.html">
								<div class="arts diy">
									<h3 class="visible-md visible-lg">艺术品定制</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/diy_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>						
					</div>
					<div>
					<div class="col-top-bottom">
						<h3 class="news">ArtCostomize艺术品资讯专区</h3>
						<a href="newslist.jsp" class="now-in">进 入</a>
					</div>
					</div>
				</div>
				<div class="col-md-3 per">
					<a href="Artist.html">
						<img class="img-responsive" src="<%=basePath%>image/artist.png" >
						<div class="six">
							<h4>平台艺术家</br>专区 >></h4>
						</div>
					</a>
				</div>
			</div>

			<div class="content-top visible-md">
				<div class="col-md-12 col-top-bottom1 arts1">
					<h3 class="news1">艺术品成品专区</h3>
					<a href="home.jsp" class="now-in1">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1 diy1">
					<h3 class="news1">艺术品定制专区</h3>
					<a href="home.jsp" class="now-in1">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1 artist1">
					<h3 class="news1">平台艺术家专区</h3>
					<a href="home.jsp" class="now-in1">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1">
					<h3 class="news1">艺术品资讯专区</h3>
					<a href="newslist.jsp" class="now-in1">进 入</a>
				</div>
			</div>

			<!-- <div class="content-top visible-sm">
				<div class="col-md-12 col-top-bottom1 arts1">
					<h3 class="news2">艺术品成品专区</h3>
					<a href="home.jsp" class="now-in2">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1 diy1">
					<h3 class="news2">艺术品定制专区</h3>
					<a href="home.jsp" class="now-in2">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1 artist1">
					<h3 class="news2">平台艺术家专区</h3>
					<a href="home.jsp" class="now-in2">进 入</a>
				</div>
				<div class="col-md-12 col-top-bottom1">
					<h3 class="news2">艺术品资讯专区</h3>
					<a href="news.jsp" class="now-in2">进 入</a>
				</div>
			</div> -->

			<div class="content-top visible-xs visible-sm">
				<div class="class75">
					<div class="col-top">
						<div class="class50 black">
							<a href="Arts.html">
								<div class="arts3">
									<h3>艺术品成品</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/arts_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>
						<div class="class50 black1-in">
							<a href="DIY.html">
								<div class="arts3 diy3">
									<h3>艺术品定制</br>专区 >></h3>
								</div>
								<img src="<%=basePath%>image/diy_pic.png" alt="" style="display: none;"></a>
							</a>
						</div>						
					</div>
					<div>
					<div class="col-top-bottom3">
						<h3 class="news3">艺术品资讯专区</h3>
						<a href="newslist.jsp" class="now-in">进 入</a>
					</div>
					</div>
				</div>
				<div class="class25 per">
					<a href="Artist.html">
						<img class="img-responsive" src="<%=basePath%>image/artist.png" >
						<div class="six3">
							<h4>艺术家</br>专区 >></h4>
						</div>
					</a>
				</div>
			</div>

			<div class="sap_tabs">
				<label class="line"></label>
				<h2>艺术品成品推荐</h2>
				<div class="recommend_arts">
					<div class="col-md-4 Recommend" onmouseout="a1_f1()" onmouseover="a1_f2()">
						<img src="<%=basePath%>image/a11.jpg">
						<div class="tab_desc" id="detail_a1">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="a2_f1()" onmouseover="a2_f2()">
						<img src="<%=basePath%>image/a22.jpg">
						<div class="tab_desc" id="detail_a2">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="a3_f1()" onmouseover="a3_f2()">
						<img src="<%=basePath%>image/a33.jpg">
						<div class="tab_desc" id="detail_a3">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="sap_tabs">
				<label class="line"></label>
				<h2>艺术品定制推荐</h2>
				<div class="recommend_arts">
					<div class="col-md-4 Recommend" onmouseout="b1_f1()" onmouseover="b1_f2()">
						<img src="<%=basePath%>image/b11.jpg">
						<div class="tab_desc" id="detail_b1">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="b2_f1()" onmouseover="b2_f2()">
						<img src="<%=basePath%>image/b22.jpg">
						<div class="tab_desc" id="detail_b2">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="b3_f1()" onmouseover="b3_f2()">
						<img src="<%=basePath%>image/b33.jpg">
						<div class="tab_desc" id="detail_b3">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="sap_tabs">
				<label class="line"></label>
				<h2>艺术家推荐</h2>
				<div class="recommend_arts">
					<div class="col-md-4 Recommend" onmouseout="c1_f1()" onmouseover="c1_f2()">
						<img src="<%=basePath%>image/c11.jpg">
						<div class="tab_desc" id="detail_c1">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="c2_f1()" onmouseover="c2_f2()">
						<img src="<%=basePath%>image/c22.jpg">
						<div class="tab_desc" id="detail_c2">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 Recommend" onmouseout="c3_f1()" onmouseover="c3_f2()">
						<img src="<%=basePath%>image/c33.jpg">
						<div class="tab_desc" id="detail_c3">
							<ul class="round-top">
								<li><a href="#"><i> </i></a></li>
								<li><a href="#"><i class="round"> </i></a></li>
							</ul>
							<div class="agency">
								<div class="agency-left">
									<h6 class="arts_name">艺术品名称及描述	</h6>
									<p class="dollor item_price">竞拍价：￥170.00</p>
									<p class="dollor item_price">一口价：￥250.00</p>
									<ul class="social">
										<li><a href="#"><i class="buy"> </i></a></li>
										<li><a href="#"><i class="love"> </i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="bottom-grid">
				<img class="img-responsive" src="<%=basePath%>image/back1.jpg">
				<div class="fit">
					<h6>ART IS A FUNNY WORD</h6>
					<p>Enjoy yourself in ArtCustomize</p>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="container footer-div">
			<div class="col-md-12 footer-middle">
				<p>公司简介：这里是公司简介公司简介公司简介公司简介公司简介公司简介</p>
				<p>地址：福建省厦门市思明区422号厦门大学</p>
			</div>
			<div class="col-md-12 company">
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>