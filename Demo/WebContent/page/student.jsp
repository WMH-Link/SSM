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

	function searchSaleChance() {
		$("#dg").datagrid('load', {
			"studentno" : $("#s_studentno").val(),
			"studentname" : $("#s_studentname").val()
		});
	}

	function openSaleChanceAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加新学生");
		url = "${pageContext.request.contextPath}/studentController/save.do";
	}

	function openSaleChanceModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改学生信息");
		$("#fm").form("load", row);
		url = "${pageContext.request.contextPath}/studentController/save.do?studentid="
				+ row.studentid;
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
		$("#studentid").val("");
		$("#studentno").val("");
		$("#studentname").val("");
		$("#studentpassword").val("");

		$("#studentsex").val("");
		$("#studentfoor").val("");
		$("#studentdormitoryno").val("");
		$("#studentbed").val("");

		$("#studentage").val("");
		$("#studentphone").val("");

		$("#studentmajor").val("");
		$("#studentcollege").val("");

		$("#studenttime").val("");
		$("#remarks").val("");
	}

	function closeSaleChanceDialog() {
		$("#dlg").dialog("close");
		resetValue();
	}
	
	var data计算机科学与工程学院 = '<option value="计算机科学与技术">计算机科学与技术</option><option value="软件工程">软件工程</option><option value="计算机网络技术">计算机网络技术</option>';
	var data会计学院 = '<option value="会计信息化">会计信息化</option><option value="财务管理">财务管理</option><option value="审计学">审计学</option>';
	var data管理学院= '<option value="物流管理">物流管理</option><option value="广告学">广告学</option><option value="土地资源管理">土地资源管理</option>';
	var data机械工程学院= '<option value="机械电子工程专业">机械电子工程专业</option><option value="工业工程">工业工程</option><option value="机械设计制造及其自动化">机械设计制造及其自动化</option>';
	
	$(function () {
	  // 监听change事件
	  $('#studentcollege').change(function(){
	    var sValue = $(this).val();
	    var s2 = $('#studentmajor');
	    if(sValue) {
	      // 根据第一个select的value，决定显示哪个数据
	      s2.html(window['data' + sValue]).show();
	    } else {
	      // 根据第一个select的value是空
	      // 清空第二个select之后隐藏
	      s2.html('').hide();
	    }
	  });
	});
</script>
<title>校园宿舍管理系统</title>
</head>
<body style="margin: 1px">
	<table id="dg" title="学生信息管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/studentController/list.do"
		fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="studentid" width="50" align="center" hidden="true">编号</th>
				<th field="studentno" width="100" align="center">学生学号</th>
				<th field="studentpassword" width="100" align="center">学生密码</th>
				<th field="studentname" width="100" align="center">学生姓名</th>
				<th field="studentsex" width="100" align="center">学生性别</th>
				<th field="studentfoor" width="100" align="center">宿舍楼号</th>
				<th field="studentdormitoryno" width="100" align="center">学生宿舍</th>
				<th field="studentbed" width="100" align="center">学生床号</th>
				<th field="studentage" width="100" align="center">学生年龄</th>
				<th field="studentphone" width="100" align="center">学生联系电话</th>
				<th field="studentmajor" width="100" align="center">学生专业</th>
				<th field="studentcollege" width="100" align="center">学生学院</th>
				<th field="studenttime" width="100" align="center">学生入住时间</th>
				<th field="remarks" width="100" align="center">描述</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<div>
			<!-- 新增 -->
			<a href="javascript:openSaleChanceAddDialog()"
				class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a> <a
				href="javascript:openSaleChanceModifyDialog()"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		</div>
		<div>
			<div>
				&nbsp;学生学号：&nbsp;<input type="text" id="s_studentno" size="20"
					onkeydown="if(event.keyCode==13) searchSaleChance()" />
				&nbsp;学生名字：&nbsp;<input type="text" id="s_studentname" size="20"
					onkeydown="if(event.keyCode==13) searchSaleChance()" /> <a
					href="javascript:searchSaleChance()" class="easyui-linkbutton"
					iconCls="icon-search" plain="true">搜索</a>
			</div>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 700px; height: 450px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">

		<form id="fm" method="post">
			<table cellspacing="8px">
				<tr>
					<td>学生学号：</td>
					<td><input type="text" id="studentno" name="studentno"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>学生密码：</td>
					<td><input type="text" id="studentpassword"
						name="studentpassword" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学生姓名：</td>
					<td><input type="text" id="studentname" name="studentname"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>学生性别：</td>
					<td><select class="easyui-combobox" name="studentsex"
						id="studentsex" style="width: 154px" editable="false"
						panelHeight="auto">
							<option value="男">男</option>
							<option value="女">女</option>
					</select>
				</tr>
				<tr>
					<td>学生年龄：</td>
					<td><input type="text" id="studentage" name="studentage"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>学生联系电话</td>
					<td><input type="text" id="studentphone" name="studentphone"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学生学院:</td>
					<td><select id="studentcollege" name="studentcollege"
						style="width: 154px" >
							<option value="">请选择</option>
							<option value="计算机科学与工程学院">计算机科学与工程学院</option>
							<option value="会计学院">会计学院</option>
							<option value="管理学院">管理学院</option>
							<option value="机械工程学院">机械工程学院</option>
					</select></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>学生专业:</td>
					<td><select id="studentmajor" style="width: 154px" name="studentmajor">
					</select>
					</td>

				</tr>
				<tr>
					<td>学生入住时间：</td>
					<td><input type="text" id="studenttime" name="studenttime"/></td>
					<td><p>格式为:yyyy-mmm-dd</p></td>
					
					<td>宿舍楼号：</td>
					<td><input type="text" id="studentfoor" name="studentfoor"
						class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<td>学生宿舍：</td>
					<td><input type="text" id="studentdormitoryno" name="studentdormitoryno"
						class="easyui-validatebox" required="true" /></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>学生床号：</td>
					<td><select class="easyui-combobox" name="studentbed"
						id="studentbed" style="width: 154px" editable="false"
						panelHeight="auto">
							<option value="1号床铺">1号床铺</option>
							<option value="2号床铺">2号床铺</option>
							<option value="3号床铺">3号床铺</option>
							<option value="4号床铺">4号床铺</option>
					</select>
				</tr>
				<tr>
					<td>描述：</td>
					<td><input type="text" id="remarks" name="remarks"
						class="easyui-textbox" required="true">
					<td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveSaleChance()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> 
			<a href="javascript:closeSaleChanceDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>