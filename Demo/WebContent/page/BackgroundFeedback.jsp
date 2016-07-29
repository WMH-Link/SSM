<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
function searchUser(){
	 $("#dg").datagrid('load',{
		"noticetime":$("#s_noticePeople").datebox("getValue")
		
	 });
 }
</script>

<title>反馈界面</title>
</head>
<body style="margin: 1px">
	<table id="dg" width=“100%” title="反馈管理" class="easyui-datagrid" toolbar="#tb" url="/Demo/FeedbackController/list.do" style="width:auto;  padding: 5px" pagination="true" rownumbers="true" fit="true">
		<thead>
			<tr>
	   			<th data-options="field:'noticecontent'" width="40%" align="center">反馈内容</th>
	   			<th data-options="field:'noticepeople'"  width="20%" align="center">反馈人</th>
	   			<th data-options="field:'noticetime'"  width="20%" align="center">反馈时间</th>
	   			<th data-options="field:'remarks'"  width="20%" align="center">描述</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
	 		&nbsp;反馈时间：&nbsp;<input type="text" class="easyui-datebox" name="s_noticePeople"  id="s_noticePeople" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
	 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		</div>
	</div>
	
</body>
</html>