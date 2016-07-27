<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
 
 var url;
 
 $(function(){
	$("#assignMan").combobox({
		onSelect:function(record){
			if(record.trueName!=''){
				$("#assignTime").val(getCurrentDateTime());
			}else{
				$("#assignTime").val("");
			}
		}
	}); 
 });
 
 function searchSaleChance(){
	 $("#dg").datagrid('load',{
		"thingdormitory":$("#s_customerName").val(), 
		"thingname":$("#s_overView").val(), 
		"thingstate":$("#s_state").combobox("getValue")
	 });
 }
 
 function formatState(val,row){
	 if(val==1){
		 return "已分配";
	 }else{
		 return "未分配";
	 }
 }
 
 function openSaleChanceAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加新物品");
	 $("#createMan").val('${currentUser.trueName}');
	 $("#createTime").val(getCurrentDateTime());
	 url="${pageContext.request.contextPath}/thing/save.do";
 }
 
 function openSaleChanceModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","修改物品请客");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/thing/save.do?thingid="+row.thingid;
 }
 
 function saveSaleChance(){
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
	 $("#thingid").val("");
	 $("#thingno").val("");
	 $("#thingname").val("");
	 $("#thingtype").val("");
	 $("#thingstate").val("");
	 $("#thingdormitory").val("");
	 $("#remark").val("");
 }
 
 function closeSaleChanceDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 
 function deleteSaleChance(){
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
			$.post("${pageContext.request.contextPath}/thing/delete.do",{ids:ids},function(result){
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
<title>校园宿舍管理系统</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="公共物品管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/thing/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   	 	<th field="cb" checkbox="true" align="center"></th>
   		<th field="thingno" width="50" align="center">物品编号</th>
   		<th field="thingname" width="100" align="center">物品名称</th>
   		<th field="thingstate" width="100" align="center">物品状态</th>
   		<th field="thingdormitory" width="50" align="center">宿舍号</th>
   		<th field="remark" width="200" align="center">描述</th>
   	
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 	<!-- 新增 -->
 		<a href="javascript:openSaleChanceAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
 		<a href="javascript:openSaleChanceModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 <!--删除 	<a href="javascript:deleteSaleChance()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a> -->	
 	</div>
 	<div>
 	
 	<!-- 客户名称  概要 创建人 分配状态-->
 		&nbsp;宿舍号：&nbsp;<input type="text" id="s_customerName" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		&nbsp;物品名称：&nbsp;<input type="text" id="s_overView" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>
 		<!--  &nbsp;物品类型：&nbsp;<input type="text" id="s_createMan" size="20" onkeydown="if(event.keyCode==13) searchSaleChance()"/>-->
 		&nbsp;物品状态：&nbsp;<select class="easyui-combobox" id="s_state" editable="false" panelHeight="auto" >
 								<option value="">请选择...</option>	
 								<option value="完整">完整</option>
 								<option value="损坏">损坏</option>
 								<option value="丢失">丢失</option>						
 		                    </select>
 		<a href="javascript:searchSaleChance()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>物品编号：</td>
   			<td><input type="text" id="thingno" name="thingno" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>物品名称</td>
   			<td><input type="text" id="thingname" name="thingname" /></td>
   		</tr>
   		<tr>
   			<td>物品状态：</td>
   			<td>
   			<select class="easyui-combobox"  name="thingstate"  id="thingstate" editable="false" panelHeight="auto" >
 								<option value="">请选择...</option>	
 								<option value="完整">完整</option>
 								<option value="损坏">损坏</option>
 								<option value="丢失">丢失</option>						
 		                    </select>
   			<!-- 物品状态 <input type="text" id="linkMan" name="linkMan" />-->
   			</td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>宿舍号：</td>
   			<td><input type="text" id="thingdormitory" name="thingdormitory" /></td>
   		</tr>
   <!--	<tr>
   	  			<td>类型：</td>
   			<td><input type="text" id="thingtype" name="thingtype" class="easyui-numberbox" data-options="min:0,max:100" required="true"/>&nbsp;</td>
   			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;</td>
   		</tr> 
   		  -->
   		<tr>
   			<td>类型：</td>
   			<td colspan="4"><input type="text" id="thingtype" name="thingtype" style="width: 420px"/></td>
   		</tr>  
   		<tr>
   			<td>描述：</td>
   			<td colspan="4">
   				<textarea rows="5" cols="50" id="remark" name="remark"></textarea>
   			</td>
   		</tr>
   		<!-- <tr>
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
   		</tr> -->
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveSaleChance()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeSaleChanceDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>