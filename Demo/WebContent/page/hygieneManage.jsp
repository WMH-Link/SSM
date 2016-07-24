<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
 
 var url;
 
/*  $(function(){
	$("#assignMan").combobox({
		onSelect:function(record){
			if(record.trueName!=''){
				$("#assignTime").val(getCurrentDateTime());
			}else{
				$("#assignTime").val("");
			}
		}
	}); 
 }); */
 
 function searchSaleChance(){
	 $("#dg").datagrid('load',{
		"customerName":$("#s_customerName").val(), 
		"overView":$("#s_overView").val(), 
		"createMan":$("#s_createMan").val(), 
		"state":$("#s_state").combobox("getValue")
	 });
 }
 
 function formatState(val,row){
	 if(val==1){
		 return "已分配";
	 }else{
		 return "未分配";
	 }
 }
 
 function openHygieneAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加销售机会信息");
	 $("#createMan").val('${currentUser.trueName}');
	 $("#createTime").val(getCurrentDateTime());
	 url="${pageContext.request.contextPath}/saleChance/save.do";
 }
 
 function openHygieneModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑销售机会信息");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/saleChance/save.do?id="+row.id;
 }
 
 function saveHygiene(){
	 $("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	 });
 }
 
 function resetValue(){
	 $("#customerName").val("");
	 $("#chanceSource").val("");
	 $("#linkMan").val("");
	 $("#linkPhone").val("");
	 $("#cgjl").numberbox('setValue',"");
	 $("#overView").val("");
	 $("#description").val("");
	 $("#createMan").val("");
	 $("#createTime").val("");
	 $("#assignMan").combobox("setValue","");
	 $("#assignTime").val("");
 }
 
 function closeHygieneDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 
 function deleteHygiene(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/saleChance/delete.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功删除！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
				}
			},"json");
		} 
	 });
 }
 
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="卫生记录管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="hygieneController/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="hygieneid" width="50" align="center" hidden="true">ID</th>
   		<th field="hygienefloor" width="200" align="center">楼号</th>
   		<th field="hygienedormitoryno" width="200" align="center" hidden="true">宿舍号</th>
   		<th field="hygienecontent" width="400" align="center">卫生状况</th>
   		<th field="hygienegrade" width="100" align="center">卫生等级</th>
   		<th field="hygienetime" width="200" align="center">卫生检查时间</th>
   		<th field="remarks" width="200" align="center" hidden="true">描述</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openHygieneAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
 		<a href="javascript:openHygieneModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteHygiene()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;楼号：&nbsp;<input type="text" id="s_hygienefloor" size="20" onkeydown="if(event.keyCode==13) searchHygiene()"/>
 		&nbsp;寝室号：&nbsp;<input type="text" id="s_hygienedormitoryno" size="20" onkeydown="if(event.keyCode==13) searchHygiene()"/>
 		&nbsp;卫生等级：&nbsp;<select class="easyui-combobox" id="s_hygienegrade" editable="false" panelHeight="auto" >
 								<option value="">请选择</option>	
 								<option value="0">0</option>
 								<option value="1">1</option>
 								<option value="2">2</option>
 								<option value="3">3</option>					
 		                    </select>
 		<a href="javascript:searchHygiene()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>客户名称：</td>
   			<td><input type="text" id="customerName" name="customerName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>机会来源</td>
   			<td><input type="text" id="chanceSource" name="chanceSource" /></td>
   		</tr>
   		<tr>
   			<td>联系人：</td>
   			<td><input type="text" id="linkMan" name="linkMan" /></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>联系电话：</td>
   			<td><input type="text" id="linkPhone" name="linkPhone" /></td>
   		</tr>
   		<tr>
   			<td>成功几率(%)：</td>
   			<td><input type="text" id="cgjl" name="cgjl" class="easyui-numberbox" data-options="min:0,max:100" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
   		</tr>
   		<tr>
   			<td>概要：</td>
   			<td colspan="4"><input type="text" id="overView" name="overView" style="width: 420px"/></td>
   		</tr>
   		<tr>
   			<td>机会描述：</td>
   			<td colspan="4">
   				<textarea rows="5" cols="50" id="description" name="description"></textarea>
   			</td>
   		</tr>
   		<tr>
   			<td>创建人：</td>
   			<td><input type="text" readonly="readonly" id="createMan" name="createMan" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>创建时间：</td>
   			<td><input type="text" id="createTime" name="createTime" readonly="readonly"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>指派给：</td>
   			<td><input class="easyui-combobox" id="assignMan" name="assignMan" data-options="panelHeight:'auto',editable:false,valueField:'trueName',textField:'trueName',url:'${pageContext.request.contextPath}/user/customerManagerComboList.do'"/></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>指派时间：</td>
   			<td><input type="text" id="assignTime" name="assignTime" readonly="readonly"/></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveHygiene()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeHygieneDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>