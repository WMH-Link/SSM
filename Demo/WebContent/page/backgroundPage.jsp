<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宿舍后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/Demo/css/mainPage/bootstrap.min.css" />
<link rel="stylesheet" href="/Demo/bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/Demo/css/mainPage/fullcalendar.css" />
<link rel="stylesheet" href="/Demo/css/mainPage/matrix-style.css" />
<link rel="stylesheet" href="/Demo/css/mainPage/matrix-media.css" />
<link href="/Demo/css/mainPage/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="/Demo/css/mainPage/jquery.gritter.css" />

<link rel="stylesheet" type="text/css" href="/Demo/jquery-easyui-1.4.5/themes/black/easyui.css" >
<link rel="stylesheet" type="text/css" href="/Demo/jquery-easyui-1.4.5/themes/icon.css" >
 <link rel="stylesheet" type="text/css" href="/Demo/css/styles.css" > 
 
<script type="text/javascript" src="/Demo/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/Demo/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="/Demo/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script src="/Demo/bootstrap/js/bootstrap.min.js"></script> 
<script src="/Demo/js/matrix.js"></script>
<script type="text/javascript">
	var url;
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
		
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="/Demo/LoginController/modifyPassword.do?";
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				if(oldPassword!='${adminUser.adminpassword}'){
					$.messager.alert("系统提示","用户原密码输入错误！");
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
					resetValue();
					$("#dlg").dialog("close");
				}else{
					$.messager.alert("系统提示","密码修改失败！");
					return;
				}
			}
		 });
	}
	
	function closePasswordModifyDialog(){
		resetValue();
		$("#dlg").dialog("close");
	}
	
	function resetValue(){
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗？",function(r){
			if(r){
				window.location.href='/Demo/LoginController/logout.do';
			} 
		 });
	}
</script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="#">宿舍后台管理系统</a></h1>
</div>

<div id="search" class="navbar navbar-inverse">
  <ul class="nav">
	 <li class=""><a title="" ><i class="icon icon-cog"></i> <span class="text">欢迎：&nbsp;&nbsp;${adminUser.adminname}</span></a></li>
    <li class=""><a title="" href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'""><i class="icon icon-cog"></i> <span class="text">修改密码</span></a></li>
    <li class=""><a title="" href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
  </ul>
</div>

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 导航菜单</a>
  <ul>
	  <li class="submenu"><a style="font-size: 18px;"><i class="icon icon-th-list"></i> <span style="font-size: 16px;">学生信息管理</span> </a>
	      <ul>
	        <li><a href="javascript:openTab('学生信息管理','student.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 195px"><span style="font-size: 16px;">学生信息</span></a></li>
	      </ul>
	    </li>
	  <li class="submenu"> <a style="font-size: 18px;"><i class="icon icon-th-list"></i> <span>寝室管理</span> </a>
	      <ul>
	        <li><a href="javascript:openTab('公共物品管理','thing.jsp','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 195px;"><span style="font-size: 16px;">公共物品管理</span></a></li>
			<li><a href="javascript:openTab('报修记录','Repair.jsp','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 195px;"><span style="font-size: 16px;">报修记录</span></a></li>
			<li><a href="javascript:openTab('卫生记录','hygieneManage.jsp','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 195px;"><span style="font-size: 16px;">卫生记录</span></a></li>
	   
	      </ul>
   	  </li>
   	   <li class="submenu"> <a style="font-size: 18px;"><i class="icon icon-th-list"></i> <span>考勤管理</span> </a>
	      <ul>
	        <li><a href="javascript:openTab('考勤管理','checksManage.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 195px;"><span style="font-size: 16px;">考勤管理</span></a></li>
	        
	      </ul>
   	  </li>
   	   <li class="submenu"> <a href="#" style="font-size: 18px;"><i class="icon icon-th-list"></i> <span>公告管理</span> </a>
	      <ul>
	        <li><a href="javascript:openTab('公告','notice.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 195px;"><span style="font-size: 16px;">公告</span></a></li>
	      </ul>
   	  </li>
  	  <li class="submenu"> <a  style="font-size: 18px;"><i class="icon icon-th-list"></i> <span>反馈管理</span></a>
  	  	<ul>
	        <li><a  href="javascript:openTab('反馈信息','BackgroundFeedback.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 195px;font-size: 18px;"><span style="font-size: 16px;">反馈信息</span></a></li>
	   </ul>
	  </li> 
  </ul>
</div>
<!--end-Footer-part-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px"><font color="red" size="10">系统需知</font></div>
		</div>
	</div>
<!--Action boxes-->

</div>


<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2016 &copy;Dormitory ManageSystem  <a href="http://themedesigner.in/"></a> </div>
</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名：</td>
   			<td><input type="text" id="userName" name="userName" readonly="readonly" value="${adminUser.adminname}" style="width: 200px"/>
   			<input type="hidden" id="adminid" name="adminid" value="${adminUser.adminid}" />
   			</td>
   		</tr>
   		<tr>
   			<td>原密码：</td>
   			<td><input type="password" id="oldPassword" name="oldPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>新密码：</td>
   			<td><input type="password" id="newPassword" name="newPassword" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   		<tr>
   			<td>确认新密码：</td>
   			<td><input type="password" id="newPassword2" name="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
<!--end-Footer-part--> 
</body>
</html>
