<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/student.css" rel="stylesheet" /> 
<link href="${pageContext.request.contextPath}/css/student-responsive.css" rel="stylesheet" /> 
<link href="${pageContext.request.contextPath}/jquery-easyui-1.4.5/themes/bootstrap/easyui.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

$(function(){
	$("#date").html(getCurrentDate());  
});

	function openTab(text,url){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='aotu' style='width:100%;height:470px' src='${pageContext.request.contextPath}/student/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				closable:true,
				content:content
			});
		}
	}
	
	function closeTab(text){
		$("#tabs").tabs("close",text);
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
<input type="hidden" id="tab1"  onclick="closeTab('个人信息')" />
<input type="hidden" id="tab2" onclick="closeTab('反馈')" />

<div class="navbar navbar-fixed-top" >	
	<div class="navbar-inner" style="background-color: #333" >		
		<div class="container">							
			<div class="nav-collapse">	
			<font size="5" color="white">学生宿舍信息系统</font>		
				<ul class="nav pull-right">					
					<li class="dropdown">						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							<font size="2" color="white">设置</font> <b class="caret" style="color: white"></b>							
						</a>						
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:openTab('个人信息','studentManage.jsp')"><i class="icon-user"></i> 个人信息  </a>
							</li>
							
							<li>
								<a href="javascript:openTab('反馈','FeedBack.jsp')"><i class="icon-lock"></i> 反馈 </a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="javascript:logout()"><i class="glyphicon glyphicon-off"></i> 退出 </a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div>
			
		</div> 
		
	</div> 
	
</div>

<div id="content">	
	<div class="container">		
		<div class="row">			
			<div class="col-xs-3">
				<div align="center" style="margin-bottom: 10px">
					欢迎您，今天是<span id="date"></span>
				</div>	
							
				<div class="account-container">									
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/image/headshot.png" alt="" class="thumbnail" />
					</div> 
										
					<div class="account-details">					
						<span class="account-name">${student.studentname}</span>						
						<span class="account-no"style="margin-top: 5px">${student.studentno}</span>						
							
						<span class="account-actions" style="margin-top: 10px">
							<a href="javascript:openTab('修改密码','changePassword.jsp')"><font size="2">修改密码</font></a> |
							
							<a href="javascript:logout()"><font size="2">注销</font></a>
						</span>
						
					</div> 														
				</div> 
												
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">					
					<li>
						<a href="javascript:openTab('主页','main.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-home"></i>
							&nbsp;&nbsp;<font size="4">主页</font>	
						</a>
					</li>
					
					<li>
						<a href="javascript:openTab('公告','noticeManage.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-envelope"></i>
							&nbsp;&nbsp;<font size="4">公告</font>	
						</a>
					</li>
					
					<li>
						<a href="javascript:openTab('考勤','checksManage.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-pencil"></i>
							&nbsp;&nbsp;<font size="4">考勤</font>		
						</a>
					</li>
					
					<li>
						<a href="javascript:openTab('公共物品','thingManage.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-book"></i>
							&nbsp;&nbsp;<font size="4">公共物品</font>	
						</a>
					</li>
					
					<li>
						<a href="javascript:openTab('报修记录','repairManage.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-wrench"></i>
							&nbsp;&nbsp;<font size="4">报修记录</font>	
						</a>
					</li>
					
					<li>
						<a href="javascript:openTab('卫生记录','hygieneManage.jsp')">
							&nbsp;&nbsp;<i class="glyphicon glyphicon-erase"></i>
							&nbsp;&nbsp;<font size="4">卫生记录</font>							
						</a>
					</li>					
					
				</ul>	
				
				<hr />
				
				<div class="sidebar-extra">
					<p></p>
				</div>
				
				<br />
		
			</div>
						
			<div class="col-xs-9">
				<div class="easyui-tabs" style="height:500px" id="tabs">
					<div title="主页">
						<div align="center" style="padding-top: 80px">
							<font color="red" size="10">欢迎使用</font><br/><br/><br/>							
						</div>
						<div style="padding-left:150px;padding-right:150px">
							<font size="5">注意事项：</font>
							<ul >
								<li>学生必须在指定的寝室、铺位入住，不得随意调换寝室和床位；</li> 
								<li>严禁男、女学生跨入对方的生活区，禁止串寝室；</li> 
								<li>严禁在寝室抽烟、酗酒、赌博、玩牌，不准在寝室进行聚会庆典活动；</li>
								<li>严禁在寝室内私藏铁棍、刀具等物品，不准将易燃物品、化学药品及其它危险物品放在寝室内，不准私接电线、电灯及使用电器设备，不得无故动用消防灭火器具；</li>
								<li>寝室内务卫生做到整洁、统一、有序，养成讲究个人和集体卫生的好习惯，寝室内不准乱涂写、乱张贴，保持墙壁洁白无污迹；</li>
								<li>寝室长负责检查督促值日生完成本寝室内务工作,做好安全防范工作，抵制各种不良行为，发现问题不得隐瞒，需及时向老师报告；</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
						
		</div>		
	</div> 
</div> 
						
<div id="footer">	
	<div class="container">				
		<hr />
		<p>&copy; 2016 WMH Corporation. All rights reserved.</p>
	</div> 
	
</div>
</body>
</html>