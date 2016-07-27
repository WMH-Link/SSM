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
<script src="${pageContext.request.contextPath}/js/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.orderBars.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.resize.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/bar.js"></script> --%>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
		
	function openTab(text,url){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='aotu' style='width:100%;height:100%' src='${pageContext.request.contextPath}/student/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				closable:true,
				content:content
			});
		}
	}
	
</script>

</head>
<body>
<div class="navbar navbar-fixed-top" >	
	<div class="navbar-inner" style="background-color: #333">		
		<div class="container">			
			<a class="brand" href="./">学生宿舍信息系统</a>			
			<div class="nav-collapse">			
				<ul class="nav pull-right">					
					<li class="dropdown">						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							设置 <b class="caret"></b>							
						</a>						
						<ul class="dropdown-menu">
							<li>
								<a href="#"><i class="icon-user"></i> 个人信息  </a>
							</li>
							
							<li>
								<a href="#"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="#"><i class="glyphicon glyphicon-off"></i> 退出</a>
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
					<span id="date">欢迎您，2016年7月25日 星期一</span>
				</div>	
							
				<div class="account-container">									
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/image/headshot.png" alt="" class="thumbnail" />
					</div> 
										
					<div class="account-details">					
						<span class="account-name">学生姓名</span>						
						<span class="account-no">学号</span>						
							
						<span class="account-actions">
							<a href="javascript:;">修改密码</a> |
							
							<a href="javascript:;">注销</a>
						</span>
						
					</div> 														
				</div> 
												
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">					
					<li class="active">
						<a href="#">
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
					<div title="首页">
						<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
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