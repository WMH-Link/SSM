<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
	function resetValue() {
		$("#noticetitle").val("");
		$("#noticeauthor").val("");
		$("#noticetime").val("");
	}

	function formatState(val, row) {
		return "<a href='javascript:openSaleChanceModifyDialog()'>"
				+ row.noticetitle + "</a>";
	}

	//修改
	function openSaleChanceModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		/* if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		} */
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑公告信息");
		$("#fm").form("load", row);
		url = "${pageContext.request.contextPath}/Notice/save.do?noticeid="
				+ row.noticeid;
	}
	//关闭
	function closeSaleChanceDialog() {
		$("#dlg").dialog("close");
		resetValue();
		location.reload();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div style="width: 100%; height: 600px;">
		<table id="dg" title="公告管理" class="easyui-datagrid" fitColumns="true"
			pagination="true"
			url="${pageContext.request.contextPath}/Notice/list.do" fit="true"
			toolbar="#tb">
			<thead>
				<tr>
					<th field="noticetitle" width="40%" align="center"
						formatter="formatState">公告标题</th>
					<th field="noticeauthor" width="10%" align="center">发布人</th>
					<th field="noticetime" width="15%" align="center">发布时间</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 500px; height: 450px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>公告类型</td>
					<td><input type="text" id="noticetype" name="noticetype"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>公告标题</td>
					<td><input type="text" id="noticetitle" name="noticetitle"
						readonly="readonly" /></td>

				</tr>
				<tr>
					<td>发布人</td>
					<td><input type="text" id="noticeauthor" name="noticeauthor"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>内容</td>
					<td colspan="4"><textarea id="noticecontent"
							name="noticecontent" style="width: 200px;; height: 200px;"
							readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td>发布时间</td>
					<td><input type="datetime" id="noticetime" name="noticetime"
						class="easyui-validatebox" readonly="readonly" />&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:closeSaleChanceDialog()" class="easyui-linkbutton"
			iconCls="icon-cancel" >关闭</a>
	</div>
</body>
</html>