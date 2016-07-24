<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	function searchSaleChance() {
		$("#dg").datagrid('load', {
			"repairid" : $("#s_repairid").val(),
			"repairtime" : $("#s_repairtime").val(),
		});
	}

	function openSaleChanceAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加销售机会信息");
		$("#createMan").val('${currentUser.trueName}');
		$("#createTime").val(getCurrentDateTime());
		url = "${pageContext.request.contextPath}/saleChance/save.do";
	}

	function openSaleChanceModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑销售机会信息");
		$("#fm").form("load", row);
		url = "${pageContext.request.contextPath}/saleChance/save.do?repairid="
				+ row.repairid;
	}

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
		$("#repaircontent").val("");
		$("#repairtime").val("");
		$("#repairdotime").val("");
		$("#remarks").val("");
	}

	function closeSaleChanceDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
	<table id="dg" title="报修管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/Repair/list.do" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="repairid" width="10%" align="center">报修编号</th>
				<th field="repairfloor" width="10%" align="center">楼号</th>
				<th field="repairdormitoryno" width="10%" align="center">宿舍号</th>
				<th field="thingid" width="10%" align="center">物品编号</th>
				<th field="repaircontent" width="30%" align="center">报修原因</th>
				<th field="repairtime" width="10%" align="center">报修时间</th>
				<th field="repairdotime" width="10%" align="center">解决时间</th>
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
			&nbsp;报修时间：&nbsp;<input type="datetime-local" id="s_repairtime"
				size="20" onkeydown="if(event.keyCode==13) searchSaleChance()" /> <a
				href="javascript:searchSaleChance()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width: 700px; height: 450px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>报修编号：</td>
					<td><input type="text" id="repairid" name="repairid"
						class="easyui-validatebox" required="required" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>楼号：</td>
					<td><input type="text" id="repairfloor" name="repairfloor"
						required="required" /><font color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>宿舍号：</td>
					<td><input type="text" id="repairdormitoryno"
						name="repairdormitoryno" required="required" /><font color="red">*</font></td>
				</tr>
				<tr>
					<td>物品编号：</td>
					<td colspan="4"><input type="text" id="thingid" name="thingid"
						style="width: 420px" /><font color="red">*</font></td>
				</tr>
				<tr>
					<td>报修原因：</td>
					<td><input type="text" id="repaircontent" name="repaircontent"
						readonly="readonly" class="easyui-validatebox" required="required" />&nbsp;<font
						color="red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>报修时间：</td>
					<td><input type="text" id="repairtime" name="repairtime"
						required="required" readonly="readonly" />&nbsp;<font color="red">*</font></td>
					<td>解决时间：</td>
					<td><input type="text" id="repairdotime" name="repairdotime"
						readonly="readonly" />&nbsp;<font color="red">*</font></td>
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