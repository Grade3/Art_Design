<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Chat</title>
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
				height:'100px',
		        uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
		        allowFileManager : false,
		        items:[
		                'image', 'media','emoticons'
		       ],
			});
		});
	</script>
	<style type="text/css">
		
		@media all and (max-width: 992px) {
		  #personinfo{width: 100%;height:300px;}
		  #personavator{height: 180px;width: 180px;margin-top: 6%;margin-left: 7%;float:left; border: 10px solid #eee;}
		  #personname{text-align: center;font-family: "黑体";font-size: 4em; margin-top: 0.8em;}
		  #persionintor{font-family: "黑体";font-size: 1.8em;margin-top: 0.3em;}
		  #personright{width: 65%;padding-right: 1%;margin-left: 8%; margin-top: 2%;}
		  #textform{width: 98%;height: 300px;}
		  .chat-thread{width: 100%;height:1000px; padding-top:2em;}
		  .btn_send{height: 70px; font-family: "黑体";font-size: 2em;}
		  
		}
		@media all and (max-width: 400px) {
		  #personinfo{width: 90%;height:120px;}
		  #personavator{height: 70px;width: 70px;margin-top: 6%;margin-left: 2%;float:left;}
		  #personname{text-align: center;font-family: "黑体";font-size: 1.5em;}
		  #persionintor{font-family: "黑体";font-size: 1.1em;margin-top: 5px;}
		  #personright{width: 70%;padding-right: 1%;margin-left: 4%;}
		  #textform{width: 90%;height: 100px;}
		}
		/* Medium and large screens */
		@media all and (min-width: 992px) {
		  #personinfo{width: 50%; height: 150px;}
		  #personavator{width: 100px;height: 100px;float: left;margin-top: 4%;margin-left: 8%;border: 2px solid #eee;}
		  #personname{text-align: center;font-family: "黑体";font-size: 2em;}
		  #persionintor{font-family: "黑体";font-size: 1.2em;margin-top: 5px;}
		  #personright{width: 60%;padding-right: 1%;margin-top: 3%;margin-left: 7%;}
		  #textform{width: 50%;height: 100px;}
		}
		/* #personinfo{margin: 0 auto;background-image: url(image/310.jpg);background-size: 100% 100%;} */
		body{background: #eee;}
		#personinfo{margin: 0 auto;box-shadow:0 0 15px rgba(149,149,149,0.8); background-image: url(../image/293.jpg);background-size: 100% 100%;color: white;}
		#personavator{border-radius: 50%;}
		#personright{float: left;}
		#textform{margin:0 auto 0px auto;}
		.chat-thread{box-shadow:0 0 8px rgba(149,149,149,0.5); margin-top: 0px;}
		.btn_send{ font-family: "黑体";}
	</style>
</head>

<body>
<div id="personinfo">
	<img id="personavator" src="../image/good.jpg">
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
	<textarea id="editor_id" name="content" style="width:100%;height:100px;"></textarea>
	<input type="button" class="btn btn-default btn-lg btn-block btn_send" value="发送"/>
</div>
<div>
	
</div>
</body>

</html>