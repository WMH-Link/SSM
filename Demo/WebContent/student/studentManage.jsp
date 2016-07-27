<%@page import="com.demo.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<title>User Account - Bootstrap Admin</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="bootstrap/css/font-awesome.css" rel="stylesheet" />
<link href="css/student.css" rel="stylesheet" />
<link href="css/student-responsive.css" rel="stylesheet" />
<link href="css/plans.css" rel="stylesheet" />


<script src="bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="text/javascript">
function openPasswordModifyDialog(){
	$("#dlg").dialog("open").dialog("setTitle","修改密码");
	url="${pageContext.request.contextPath}/user/modifyPassword.do?id=${student.studentid}";
}

function modifyPassword(){
	$("#edit-profile2").form("submit",{
		url:url,
		onSubmit:function(){
			var oldPassword=$("#oldPassword").val();
			var newPassword=$("#newPassword").val();
			var newPassword2=$("#newPassword2").val();
			if(!$(this).form("validate")){
				return false;
			}
			if(oldPassword!='${currentUser.password}'){
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
} -->
</script>
</head>

<body>
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-th-large"></i> User Account
					</h1>
					<div class="row">
						<div class="span9">
							<div class="widget">
								<div class="widget-header">
									<h3>Basic Information</h3>
								</div>
								<div class="widget-content">
									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#1" data-toggle="tab">Profile</a>
											</li>
											<li><a href="#2" data-toggle="tab">Settings</a></li>
										</ul>
										<br />
										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal"
													url="${pageContext.request.contextPath}/studentController/findById.do?id=1" />
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="studentno">学生学号</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentno" value="${student.studentno}" disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentpassword">学生密码</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentpassword" value="${student.studentpassword}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentname">学生姓名</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentname" value="${student.studentname}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentsex">学生性别</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentsex" value="${student.studentsex}"
																disabled="" />
														</div>
													</div>

													<div class="control-group">
														<label class="control-label" for="studentdormitoryno">学生宿舍</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentdormitoryno"
																value="${student.studentdormitoryno}" disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentbed">学生床号</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentbed" value="${student.studentbed}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentage">学生年龄</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentage" value="${student.studentage}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentphone">学生联系电话</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentphone" value="${student.studentphone}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentcollege">学生学院</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentcollege" value="${student.studentcollege}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentmajor">学生专业</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studentmajor" value="${student.studentmajor}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studenttime">学生入学时间</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="studenttime" value="${student.studenttime}"
																disabled="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="remarks">描述</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																id="remarks" value="${student.remarks}" disabled="" />
														</div>
													</div>
												</fieldset>
												</form>
											</div>
											<%-- <div class="tab-pane" id="2">
												<form id="edit-profile2" class="form-horizontal"
													url="${pageContext.request.contextPath}/studentController/findById.do?id=1" />
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="studentno">学号</label>
														<div class="controls">
															<input type="text" class="input-large" id="studentno"
																value="${student.studentno}" disabled=""/>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="studentpassword">密码</label>
														<div class="controls">
															<input type="text" class="input-large" id="oldpassword"
																name="oldpassword" value="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="newpassword">新密码</label>
														<div class="controls">
															<input type="text" class="input-large" id="newpassword"
																name="newpassword" value="" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="newpassword2">密码</label>
														<div class="controls">
															<input type="text" class="input-large" id="newpassword2"
																name="newpassword2" value="" />
														</div>
													</div>
													<br />
													<div class="form-actions">
														<a href="javascript:modifyPassword()"
															class="btn btn-primary" iconCls="icon-ok">保存</a> <a
															href="javascript:closePasswordModifyDialog()"
															class="btn btn-primary" iconCls="icon-cancel">关闭</a>

													</div>
												</fieldset>
												</form>
											</div> --%>
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>