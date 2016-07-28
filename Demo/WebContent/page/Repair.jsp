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
	var url;
	//根据条件查询信息
	function searchSaleChance() {
		$("#dg").datagrid('load', {
			"repairid" : $("#s_repairid").val(),
			"repairfloor" : $("#s_repairfloor").val(),
			"repairdormitoryno" : $("#s_repairdormitoryno").val(),
		});
	}
	//编辑修改
	function openSaleChanceModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "添加报修记录解决时间");
		$("#fm").form("load", row);
		url = "${pageContext.request.contextPath}/Repair/save.do?repairid="
				+ row.repairid;
	}
	//保存
	function saveSaleChance() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$.messager.alert("系统提示", "保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "保存失败！");
					return;
				}
			}
		});
	}

	function resetValue() {
		$("#repairid").val("");
		$("#repairfloor").val("");
		$("#repairdormitoryno").val("");
		$("#thingid").val("");
		$("#thingname").val("");
		$("#repaircontent").val("");
		$("#repairtime").val("");
		$("#repairdotime").val("");
		$("#remarks").val("");
	}
	//关闭
	function closeSaleChanceDialog() {
		$("#dlg").dialog("close");
		$('#dg').datagrid('reload');
		//resetValue();
	}
</script>

<style type="text/css">
label {
	width: 80px;
}
</style>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
	<table id="dg" title="报修管理" class="easyui-datagrid " fitColumns="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/Repair/list.do" fit="true"
		toolbar="#tb"  style="">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="repairid" width="10%" align="center">报修编号</th>
				<th field="repairfloor" width="10%" align="center">楼号</th>
				<th field="repairdormitoryno" width="10%" align="center">宿舍号</th>
				<th field="thingid" width="10%" align="center">物品编号</th>
				<th field="thingname" width="10%" align="center">物品名称</th>
				<th field="repaircontent" width="20%" align="center">报修原因</th>
				<th field="repairtime" width="15%" align="center">报修时间</th>
				<th field="repairdotime" width="15%" align="center">解决时间</th>
				<th field="remarks" width="10%" align="center" hidden="true">描述</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openSaleChanceModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		</div>
		<div>
			&nbsp;报修编号：&nbsp;<input type="text" id="s_repairid" size="20"
				onkeydown="if(event.keyCode==13) searchSaleChance()" />
			&nbsp;楼号：&nbsp;<input type="text" id="s_repairfloor" size="20"
				onkeydown="if(event.keyCode==13) searchSaleChance()" />
			&nbsp;宿舍号：&nbsp;<input type="text" id="s_repairdormitoryno" size="20"
				onkeydown="if(event.keyCode==13) searchSaleChance()" /> <a
				href="javascript:searchSaleChance()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 380px; height: 400px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post" style="text-align: left; font-size: 20px;">
			<table cellspacing="8px">
				<tr>
					<td><label>报修编号</label></td>
					<td><input type="text" id="repairid" name="repairid"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>楼&nbsp;&nbsp;号</label></td>
					<td><input type="text" id="repairfloor" name="repairfloor"
						readonly="readonly" class="easyui-validatebox" /></td>
				</tr>
				<tr>
					<td><label>宿 舍 号</label></td>
					<td colspan="4"><input type="text" id="repairdormitoryno"
						name="repairdormitoryno" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>物品编号</label></td>
					<td><input type="text" id="thingid" name="thingid"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>物品名称</label></td>
					<td><input type="text" id="thingname" name="thingname"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>报修原因</label></td>
					<td><input type="text" id="repaircontent" name="repaircontent"
						required="required" readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>报修时间</label></td>
					<td><input type="text" id="repairtime" name="repairtime"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td><label>解决时间</label></td>
					<td><input type="datetime" id="repairdotime"
						name="repairdotime" class="easyui-validatebox" />&nbsp;<font
						color="red">*</font></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveSaleChance()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeSaleChanceDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>