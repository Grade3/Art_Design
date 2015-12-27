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
	<title>Artistlist</title>
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer.css" rel="stylesheet" type="text/css" />
	<link href="../css/footer2.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/artistlist.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/header.js"></script>
	<script src="../js/lanrenzhijia.js"></script>
	<style type="text/css">
		*{font-style: normal;}
	</style>
	<script type="text/javascript">
	//获取上线新闻
	function GetArtists(page,pageSize){
		$.ajax({
			type:'post',
			url:'<%=basePath%>artist.do?method=GetArtists',
			data:{page:page,pageSize:pageSize},
			success:function(json){
				var list = json.list;
				var total = json.total;
				globaltotal = total;
				if(list.length>0){
					var body = "";
					var count = 0;
					for(var i=0;i<list.length;i++){
						var username = list[i].name;
						var avator = list[i].avator;
						var id= list[i].id;
						
						if(count==0){
							body +="<div class='col-md-6 goods_two'>";
						}
						var link = "<%=basePath%>font/artistHome.jsp?id="+id;
						body+="<div class='col-xs-6 goods'><a href='"+link+"' target='_blank'><img src='"+avator+"' class='good_item'></a><div class='good_name'><p>"+username+"</p><a href='"+link+"' class='readmore' target='_blank'>进入主页</a></div></div>";
						if(count==2){
							body+="</div>";
						}
						count++;
						if(count==2)
							count=0;
					}
					if(page*pageSize <globaltotal){
						body +="<div class='col-md-12 blog-in-top'><div class='learn_more'><p>查看更多</p></div></div>";
					}
					$('#artistlist').append(body);
				}else{
					var content ="<div class='col-md-12 blog-in-top'><div class='learn_more'><p>没有更多的信息</p></div></div>";
					$('#artistlist').html(content);
				}
				var width = $(".good_item").width();
				var height = width/2.5*3;
		  		$(".good_item").height(height);
			},error:function(){
				
			}
		});
	};
	$(document).ready(function(){
		
		  $('#usernameaction').hide();
		  $('#loginoutaction').hide();
		  CheckUser();
		  var page = 1;
		  var pageSize = 12;
		  var globaltotal = 0;
		  GetArtists(page,pageSize);
		  $("#menu").click(function(){
		  $("#menu-xs").toggle(300);
		  });
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
			
			
			
			var width = $(".good_item").width();
			var height = width/2.5*3;
		  	$(".good_item").height(height);

		  	$(window).resize(function() {
		  		var width = $(".good_item").width();
				var height = width/2.5*3;
		  		$(".good_item").height(height);
		  	});
		  	
		  	
		  	$(".sub").show();
		  	$(".box_active a").click(function(){
		  		$(".sub").slideToggle("slow");
		  	});
	});

	</script>
</head>
<body>
<a href="javascript:;" class="lanrenzhijia_top hidden-xs hidden-sm"></a>

	<div class="header-top">
			<div class="container head1">
				<div class="statu_bar">
					<ul class="support">
						<li ><span ><i class="item_message"> </i>471979617@qq.com</span></li>
						<li ><span ><i class="item_tel"> </i>156-9000-8000</span></li>			
					</ul>
					<ul class="support-right">
						<li class="li1" id="loginaction" ><a href="Login.jsp" ><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;登陆</a></li>
						<li class="li2" id="registeraction"><a href="Register.jsp" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;注册账号</a></li>
						<li class="li1" id="usernameaction"><a href="#" id="username"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;</a></li>
						<li class="li2" id="loginoutaction"><a href="<%=basePath%>customer.do?method=loginout" ><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;&nbsp;退出</a></li>			
					</ul>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="logo">
						<h1><a href="home.html">ArtCustomize</a></h1>
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
						</ul>
					</div>
					<div class="content-top content-top1 visible-xs visible-sm">
						<div class="row tag_up">
							<div class="col-xs-3 tag0 tag01">
								<div class="row col-xs-12 tag tag1">
									<a href="home.html"><span class="glyphicon glyphicon-home pattern1" aria-hidden="true"></span></br>首页</a>
								</div>			
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag2">
									<a href="goodslist.html"><span class="glyphicon glyphicon-tower pattern1" aria-hidden="true"></span></br>艺术品</a>
								</div>
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag3">
									<a href="home.html"><span class="glyphicon glyphicon-camera pattern1" aria-hidden="true"></span></br>艺术家</a>
								</div>
							</div>
							<div class="col-xs-3 tag0">
								<div class="row col-xs-12 tag tag4">
									<a href="newslist.html"><span class="glyphicon glyphicon-comment pattern1" aria-hidden="true"></span></br>资讯中心</a>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<h6 class="location"><a href="home.jsp">首页</a> <i> </i> 艺术家列表 </h6>
	</div>


	<div class="bar_news">
		<h2>艺术家列表</h2>
	</div>


	<div class="content">
		<div class="container">
			<div class="col-lg-12 good_four" id="artistlist">

				<!-- <div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/bg_login1.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>

				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 goods_two">
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
					<div class="col-xs-6 goods">
						<a href="artistHome.html" target="_blank"><img src="../image/good.jpg" class="good_item"></a>
						<div class="good_name">
							<p>艺术家名称</p>
							<a href="artistHome.html" class="readmore" target="_blank">进入主页</a>
						</div>
					</div>
				</div>
				

				<div class="col-xs-12 learn_more">
					<p>查看更多</p>
				</div>
			</div> -->
			
		</div>
	</div>


	<div class="bottom-grid1">
		<div class="fit1">
			<h3>HAPPY SHOPPING</h3>
			<p>Lorem Ipsum sit amet consectuer adipiscing elitsed diam nonummy nibh euismod</p>
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