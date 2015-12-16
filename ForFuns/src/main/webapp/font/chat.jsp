<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>精美CSS3聊天窗口DEMO演示</title>
  	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="../css/dom.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="../css/chat.css" media="screen" type="text/css" />
    <script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		KindEditor.ready(function(K) {
			 window.editor =K.create('#editor_id', {
		        uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
		        allowFileManager : false,
		        items:[
		                'image', 'media','emoticons'
		       ],
			});
		});
	</script>
	<style type="text/css">
		.chat-thread{}
		@media all and (max-width: 767px) {
		  #personinfo{width: 90%;height:120px;}
		  #personavator{height: 80px;width: 80px;margin-top: 4%;margin-left: 2%;float:left;}
		  #personname{text-align: center;font-family: "黑体";font-size: 1.5em;}
		  #persionintor{font-family: "黑体";font-size: 1.1em;margin-top: 5px;}
		  #personright{width: 70%;padding-right: 1%;margin-left: 4%;}
		  #textform{width: 90%;height: 200px;}
		}
		@media all and (max-width: 400px) {
		  #personinfo{width: 90%;height:120px;}
		  #personavator{height: 70px;width: 70px;margin-top: 8%;margin-left: 2%;float:left;}
		  #personname{text-align: center;font-family: "黑体";font-size: 1.5em;}
		  #persionintor{font-family: "黑体";font-size: 1.1em;margin-top: 5px;}
		  #personright{width: 70%;padding-right: 1%;margin-left: 4%;}
		  #textform{width: 90%;height: 200px;}
		}
		/* Medium and large screens */
		@media all and (min-width: 768px) {
		  #personinfo{width: 50%; height: 200px;}
		  #personavator{width: 150px;height: 150px;float: left;margin-top: 3%;margin-left: 2%;}
		  #personname{text-align: center;font-family: "黑体";font-size: 2em;}
		  #persionintor{font-family: "黑体";font-size: 1.2em;margin-top: 5px;}
		  #personright{width: 60%;padding-right: 1%;margin-top: 3%;margin-left: 7%;}
		  #textform{width: 50%;height: 200px;}
		}
		/* #personinfo{margin: 0 auto;background-image: url(image/310.jpg);background-size: 100% 100%;} */
		#personinfo{margin: 0 auto;background-image: url(http://static.hdslb.com/spacev2/img/theme/6.jpg);background-size: 100% 100%;color: white;}
		#personavator{border-radius: 50%;}
		#personright{float: left;}
		#textform{margin:20px auto 0px auto;}
	</style>
</head>

<body>
<div id="personinfo">
	<img id="personavator" src="http://i0.hdslb.com/user/18522/1852217/myface.jpg">
	<div id="personright">
		<div id="personname">christy</div>
		<div id="persionintor">yes, what time suits you?I was thinking after lunch, I have a meeting in the morning</div>
	</div>
</div>
<div id="convo" data-from="Sonu Joshi">  
<ul class="chat-thread">
	<li class="chatleft">Are we meeting today?</li>
	<li class="chatright">yes, what time suits you?</li>
	<li class="chatleft">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatright">Are we meeting today?</li>
	<li class="chatleft">yes, what time suits you?</li>
	<li class="chatright">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatleft">Are we meeting today?</li>
	<li class="chatright">yes, what time suits you?</li>
	<li class="chatleft">I was thinking after lunch, I have a meeting in the morning</li>
  	<li class="chatright">Are we meeting today?</li>
	<li class="chatleft">yes, what time suits you?</li>
	<li class="chatright">I was thinking after lunch, I have a meeting in the morning</li>
</ul>
</div>
<div style="text-align:center;clear:both"></div>
<div id="textform">
	<textarea id="editor_id" name="content" style="width:100%;height:100%;"></textarea>
</div>
</body>

</html>