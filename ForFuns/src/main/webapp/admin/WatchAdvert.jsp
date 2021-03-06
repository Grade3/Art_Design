<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="http://static.hdslb.com/images/favicon.ico">
<title>查看列表</title>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=path%>/css/easyUI/themes/gray/easyui.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyUI/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyUI/jquery.easyui.min.js"></script>

<style type="text/css">
	body{background: url(css/img/bg.png);}
</style>


<script>
	//获取指定名称的cookie的值 
	function getCookie(objName){
		var arrStr = document.cookie.split("; "); 
		for(var i = 0;i < arrStr.length;i ++){ 
		var temp = arrStr[i].split("="); 
		if(temp[0] == objName) return unescape(temp[1]); 
		} 
	};
	
	//初始化数据函数
	function getData(queryParams){
		$('#grid').datagrid({
			url: '<%=basePath%>/advert.do?method=GetPageAdvertByUserid',
			queryParams: queryParams,
			remoteSort:false,
			singleSelect:true,
			nowrap: true, //换行属性
			striped: true, //奇数偶数行颜色区分
			fitColumns:true,
			collapsible : true, //可折叠
			pageSize: 5,//每页显示的记录条数，默认为10  
	        pageList: [5,10,15,20,25,100],//可以设置每页记录条数的列表  
	        pagination: true,//是否这是分页
			rownumbers:true,
			frozenColumns:[[
			    {field: 'ck', checkbox: true},          
			]],
			columns: [[
				{field:'id',title:'ID',sortable:true,width:80,sortable:true,},
				{field:'title',title:'广告标题',sortable:true,width:120,sortable:true,
					editor: { type: 'validatebox',options: { required: true}  }
				},
				{field:'author',title:'作者',sortable:true,width:120,sortable:true,
					editor: { type: 'validatebox',options: { required: true}  }
				},
				{field:'imgurl',title:'封面图片',sortable:true,width:120,sortable:true,
					formatter:function(value,row,index){return "<img style='width:120px;height:70px;' src='"+row.imgurl+"' />";}
				},
				{field:'position',title:'栏位',sortable:true,width:120,sortable:true,
					formatter:function(value,row,index){
						if (value == 0 ){
							return '艺术品成品推荐';
						} else if(value ==1 ){
							return '艺术品定制推荐';
						} else if(value ==2 ){
							return '艺术家推荐';
						}
					}
				},
				{field:'isonline',title:'是否上线',sortable:true,width:120,sortable:true,
					formatter:function(value,row,index){
						if (value == 0 ){
							return '下线';
						} else if(value ==1 ){
							return '上线';
						}
					}
				},
				{field:'situation',title:'审核状态',sortable:true,width:120,sortable:true,
					formatter:function(value,row,index){
						if (value == 0 ){
							return '未审核';
						} else if(value ==1 ){
							return '审核通过';
						}else if(value==2){
							return '审核不通过';
						}
					}
				},
				{field:'suggestion',title:'审核意见',sortable:true,width:120,sortable:true,
					editor: { type: 'validatebox',options: { required: true}  }
				},
			]],
			toolbar:[
			   {//修改数据s
				   text:"编辑",
				   iconCls: "icon-edit",
				   handler: _editRow,
			   },'-',{//删除数据
				   text: "删除",
				   iconCls: "icon-remove",
				   handler: _removeRow,
			   },'-',{
				   text: "查看",
				   iconCls: "icon-edit",
				   handler:_watch,
			   },'-',{
				   text: "搜索",
				   iconCls: "icon-search",
				   handler:_search,
			   },'-',{
				   text: "还原搜索",
				   iconCls: "icon-back",
				   handler:_unsearch,
			   },'-',
			 
			],
			onAfterEdit: function(rowIndex,rowData,changes){
				doedit = undefined;
			},
			onLoadSuccess:function(data){//数据刷新的时候，编辑的坐标设为空
				doedit = undefined;
			},
			
		});
		
		//分页设置
		var p = $('#grid').datagrid('getPager');
		$(p).pagination({
	        beforePageText: '第',//页数文本框前显示的汉字  
	        afterPageText: '页    共 {pages} 页',  
	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',  
	        BeforeRefresh:function(){
				$(this).datagrid('reload'); 
				//获取数据库全部数据
			},
		});
		$('#searchdialog').dialog('close');
		
	};
	//-----------------------------还原搜索效果----------------------------
	function _unsearch(){
		var token = getCookie("token");
		var index = token.indexOf("&");
		var userid = token.substring(0,index);
		var queryParams;
		queryParams = {"userid":userid};
		getData(queryParams);
	};
	//------------------------------------插入行数据-----------------------------------
	function _insertRow(){
		if(doedit==undefined){
			 $('#grid').datagrid('appendRow',{
				row: {
					
				}
			});
			var index = $('#grid').datagrid('getRows').length-1;
			doedit = index;
			$('#grid').datagrid('beginEdit',index);
			$('#grid').datagrid('checkRow',index);
		}
	};
	//------------------------------查看数据-----------------------------
	function _watch(){
		var row = $('#grid').datagrid('getSelected');
		if(row){
			var id = row.id;
			var temp = "<%=basePath%>font/news.jsp?advertid="+id;
			window.open(temp);
		}else{
			$.messager.alert('警告','您没有选择','error');
		};
	};
	//------------------------------------编辑行数据-----------------------------------
	function _editRow(){
		var row = $('#grid').datagrid('getSelected');
		if(row){
			var id = row.id;
			var situation = row.situation;
			if(situation==1){
				$.messager.alert('警告','该广告已通过，无法编辑','error');
			}else
				location.href="AlertAdvert.jsp?advertid="+id;
		}else{
			$.messager.alert('警告','您没有选择','error');
		};
	};
	//------------------------------------删除行数据-----------------------------------
	function _removeRow(){
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length <= 0){
			$.messager.alert('警告','您没有选择','error');
		}
		else if(rows.length >= 1){
			$.messager.confirm("操作警告", "确定删除后将不可恢复！！", function(data){
				if(data){
					//原来代码开始的位置
					var ids = [];
					for(var i = 0; i < rows.length; ++i)
						{
							ids[i] = rows[i].id;
						}						
					$.post("<%=basePath%>news.do?method=deletenews", {ids: ids.toString()},
						function (data, textStatus){
						
						if(data == 'true'){
							$.messager.alert('提示','删除成功','info');
							$('#grid').datagrid('reload'); 
							} 
							else{
							$.messager.alert('提示','删除失败','fail');
							}
						}, "text");
					//原来代码结束位置
				}
			});
		}
	};
	
	 //--------------------------搜索按钮-------------------------
	function _search(){
		$('#searchdialog').dialog('open');
	}
	
	//更改datebox的日期格式
	function myformatter(value, row, index) {
		//return new Date(parseInt(value)).toLocaleString().replace(/年|月/g, "-")
		//		.replace(/日/g, " ");
		var myDate = new Date(parseInt(value));
		var year = myDate.getFullYear();
		var month = myDate.getMonth() + 1;
		var day = myDate.getDate();
		return year + '-' + month + '-' + day;
	}
	function myparser(s) {
		var ss = (s.split('/'));
		if(ss.length > 1)
			return ss[2] + "-" + ss[0] + "-" + ss[1];
		else return s;
	}
	
	//--------------------------------------主体部分！！！-----------------------------
    var doedit = undefined;//用来记录当前编辑的行，如果没有编辑的行则置为undefined
    $(function(){
		//获取数据的查询参数----过滤数据
		var token = getCookie("token");
		var index = token.indexOf("&");
		var userid = token.substring(0,index);
		var queryParams;
		queryParams = {"userid":userid};
		getData(queryParams);
	});
   	
    //--------------------------------为下拉框赋值----------------------------------
    $.fn.datagrid.defaults.view.onAfterRender=function(target){
    	 var columns = $(target).datagrid('options').columns[0];
    	 var str="";
    	 for(var i=0;i<columns.length;i++){
    		 str+="<option value=\""+columns[i].field+"\">"+columns[i].title+"</option> ";
    	 }
    	 $('#SelectName').html(str);
    };
    
    $(document).ready(function(){
    	
        //--------------------------------搜索-----------------------------------------
        $('#SelectBtn').click(function(){
        	var token = getCookie("token");
    		var index = token.indexOf("&");
    		var userid = token.substring(0,index);
        	var selectname=  $('#SelectName').val();
    		var value = $('#SearchText').val();
    		queryParams = {"selectname":selectname,"value":value,"userid":userid};
    		getData(queryParams);
    	});
      	
    });
</script>


</head>

<body bgcolor="#DDF3FF" class = "h2">
	<table id="grid"></table>
	
	
	<div id="searchdialog" class="easyui-dialog" title="搜索" style="width:400px;height:200px;"
    data-options="iconCls:'icon-save',resizable:true,modal:true">
    	<div id="totalplane" style="margin-top: 55px;padding-left: 60px;">
	  		<select id="SelectName" class="<a href="http://wuzhuti.cn/tag/easyui/" title="EasyUI">EasyUI</a>-combobox" name="dept" style="width:200px;">  
			</select>  
	  		<input class="easyui-textbox" style="width:200px;" id="SearchText"><br/>
	  		<a href="javascript:void(0)" id="SelectBtn" class="easyui-linkbutton" iconCls="icon-ok" style="width:150px;height:32px;margin-top: 10px;margin-left: 65px">确定</a>
  		</div>
	</div>
	
	
	
</body>
</html>