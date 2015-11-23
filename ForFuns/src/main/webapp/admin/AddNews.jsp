<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>查看列表</title>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=path%>/css/easyUI/themes/gray/easyui.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/AddCss.css">
<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=path%>/kindeditor/lang/zh_CN.js"></script>
<style type="text/css">
	body{background: url(css/img/bg.png);}
</style>


<script>
KindEditor.ready(function(K) {
	 window.editor =K.create('#editor_id', {
        uploadJson : '<%=basePath%>imageupload.do?method=keuploadimg',
        allowFileManager : false,
        items:[
               'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
               'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
               'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
               'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
               'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
               'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 
               'media', 'table', 'hr', 'baidumap', 'pagebreak',
               'anchor', 'link', 'unlink', '|', 'about'
       ],
	});
});
function submitForm(){
	editor.sync();
	var html = document.getElementById('editor_id').value;
	$('#ff').form('submit');
}
</script>

<style type="text/css">

</style>
</head>

<body bgcolor="#DDF3FF" class = "h2" >
	<form action="<%=basePath%>news.do?method=addnews" id="ff" method="post" style="height: 98%;margin-left: 2%;margin-top: 2%;">
		<fieldset class="simpborder" style="width: 48%; float: left; margin-right: 3%;">
			<label>是否为首页资讯</label> 
			<select name="ishot" id="n_ishot" onchange="addFile(this.options[this.options.selectedIndex].value)" style="width: 92%;" >
					<option>是</option>
					<option selected="selected">否</option>
			</select>
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left; ">
			<label>资讯标题</label>
			<input type="text" name="title">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left;margin-right: 3%;">
			<label>作者</label>
			<input  type="text" name="author">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left;">
			<label>封面图片</label>
			<input  type="file" name="file">
		</fieldset>
		<fieldset class="simpborder" style="width: 47%; float: left;margin-right: 3%;padding-left: 12px;">
			<label>上线时间</label>
			<input class="easyui-datebox" name="timestart" required style="width:91%;margin-left: 2%;">
		</fieldset>
		<fieldset class="simpborder"  style="width: 47%; float: left;padding-left: 12px;">
			<label>下线时间</label>
			<input  class="easyui-datebox" name="timeout" required style="width:91%">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left; margin-right: 3%;">
			<label>资讯概要</label>
			<input type="text" name="summary">
		</fieldset>
		<fieldset class="simpborder" style="width: 48%; float: left;">
			<label>费用</label>
			<input type="text" name="money">
		</fieldset>
		<br/>
		<fieldset>
		<textarea id="editor_id" name="content" style="width:99%;height:400px;"></textarea>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" id="formsubmit">Submit</a>
		</fieldset>
	
	</form>
	
	
	
</body>
</html>







