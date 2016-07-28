<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
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
 
 function searchChecks(){
	 $("#dg").datagrid('load',{
		"checksfloor":$("#s_checksfloor").val(), 
		"checksdormitoryno":$("#s_checksdormitoryno").val(),  
		"checkstime":$("#s_checkstime").datebox("getValue")
	 });
 }
 
 function formatState(val,row){
	 if(val==1){
		 return "已分配";
	 }else{
		 return "未分配";
	 }
 }
 
 function openChecksAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加");
	 //$("#hygieneTime").val(getCurrentDateTime());
	 url="${pageContext.request.contextPath}/checksController/save.do";
 }
 
 function openChecksModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑");
	 $("#fm").form("load",row);
	 url="${pageContext.request.contextPath}/checksController/save.do?id="+row.id;
 }
 
 function saveChecks(){
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
	 $("#checksid").val("");
	 $("#checksfloor").val("");
	 $("#checksdormitoryno").val("");
	 $("#checkscontent").val("");
	 $("#checkstime").datebox("setValue","");
	 $("#remarks").val("");
 }
 
 function closeChecksDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 
 function deleteChecks(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var ids = "";
	 for(var i=0;i<selectedRows.length;i++){
		 ids += selectedRows[i].checksid;
		 if(i<=selectedRows.length-1)
		 	ids += ","
	 }
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/checksController/delete.do",{ids:ids},function(result){
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
 <table id="dg" title="考勤管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/checksController/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="checksid" width="50" align="center" hidden="true">ID</th>
   		<th field="checksfloor" width="200" align="center">楼号</th>
   		<th field="checksdormitoryno" width="200" align="center">宿舍号</th>
   		<th field="checkscontent" width="400" align="center">考勤状况</th>
   		<th field="checkstime" width="200" align="center">考勤时间</th>
   		<th field="remarks" width="200" align="center" >描述</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openChecksAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">创建</a>
 		<a href="javascript:openChecksModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteChecks()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;楼号：&nbsp;<input type="text" id="s_checksfloor" size="20" onkeydown="if(event.keyCode==13) searchChecks()"/>
 		&nbsp;寝室号：&nbsp;<input type="text" id="s_checksdormitoryno" size="20" onkeydown="if(event.keyCode==13) searchChecks()"/>
 		&nbsp;考勤时间：&nbsp;<input type="text" id="s_checkstime" class= "easyui-datebox" />
 		<a href="javascript:searchChecks()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:700px;height:450px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post" accept-charset="UTF-8">
   	<table cellspacing="8px">
   		<tr hidden="true">
   			<td>ID：</td>
   			<td><input type="text" id="checksid" name="checksid" /></td>
   		</tr>
   		<tr>
   			<td>楼号：</td>
   			<td><input type="text" id="checksfloor" name="checksfloor" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>寝室号：</td>
   			<td><input type="text" id="checksdormitoryno" name="checksdormitoryno" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>考勤状况：</td>  			
   			<td colspan="2">
   				<textarea rows="2" cols="50" id="checkscontent" name="checkscontent" class="easyui-validatebox" required="true"></textarea>&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   		<tr>
   			<td>检查时间：</td>
   			<td><input type="text" id="checkstime" name="checkstime" class= "easyui-datebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>描述：</td>
   			<td colspan="2">
   				<textarea rows="3" cols="50" id="remarks" name="remarks"></textarea>
   			</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveChecks()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeChecksDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>