<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
    <link href="/Demo/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/Demo/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/adminia.css" rel="stylesheet" /> 
    <link href="/Demo/bootstrap/css/adminia-responsive.css" rel="stylesheet" /> 
     <link href="/Demo/bootstrap/css/font-awesome.css" rel="stylesheet" />
         
    <link href="/Demo/css/plans.css" rel="stylesheet" /> 
 
</head>
<body>



	<div class="span9">
		<h1 class="page-title">
			<i class="icon-th-large"></i> 密码管理
		</h1>

		<div class="row">
			<div class="span9">
				<div class="widget">
					<div class="widget-header">
						<h3>修改密码</h3>
					</div>
					<!-- /widget-header -->

					<div class="widget-content">
						<div class="tabbable">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#1" data-toggle="tab">Information</a>
								</li>
							</ul>
							<br />
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								 <div id="edit-profile" class="form-horizontal" > 
									<fieldset>
									<input  id="studentId" type="hidden" value="${student.studentid}" name="studentId" >
										<div class="control-group">
											<label class="control-label" for="username">Username</label>
											<div class="controls">
												<input type="text" class="input-medium disabled"
													id="username" readonly="readonly" value="${student.studentname},${student.studentpassword}"  disabled="" >
												<p class="help-block">Your username is for logging in
													and cannot be changed.</p>
											</div>
											<!-- /controls -->
										</div>
										<!-- /control-group -->
										<div class="control-group">
											<label class="control-label" >原来密码</label>
											<div class="controls">
												<input type="text" class="input-medium" id="oldPassword"
													value="" name="oldPassword"/>
											</div>
											<!-- /controls -->
										</div>
										<!-- /control-group -->

										<div class="control-group">
											<label class="control-label" >新密码</label>
											<div class="controls">
												<input type="text" class="input-medium" id="newPassword"
													value="" name="newPassword"/>
											</div>
											<!-- /controls -->
										</div>
										<!-- /control-group -->
										<div class="control-group">
											<label class="control-label" >确认密码</label>
											<div class="controls">
												<input type="text" class="input-large" id="newPassword2"
													value="" name="newPassword2"/>
											</div>
											<!-- /controls -->
										</div>
										<br />
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" id="updatePassword" />
											
											<button class="btn">Cancel</button>
										</div>
										<!-- /form-actions -->
									</fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /widget-content -->
				</div>
				<!-- /widget -->
			</div>
			<!-- /span9 -->
		</div>
	</div>
<script src="/Demo/bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="/Demo/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
$(function(){
	$("#updatePassword").click(function(){  
            // 做表单输入校验  
		var oldPassword=$("#oldPassword");
		var newPassword=$("#newPassword");
		var newPassword2=$("#newPassword2"); 
            var msg = "";  
			if($.trim(oldPassword.val())!='${student.studentpassword}'){
				 msg = "用户原密码输入错误！";  
				 alert(msg);
				 oldPassword.val(""); 
			}
			else if($.trim(newPassword.val())!=$.trim(newPassword2.val())){
				msg = "确认密码输入错误！"; 
				alert(msg);
				newPassword.val(""); 
				newPassword2.val(""); 
				return false;
			}
			 
			else{
			   $.ajax({
            			url:"/Demo/LoginController/changePass.do",
            			type:"post",
            			dataType:"json",
            			data:{
            					studentId:$("#studentId").val(),
            					newPassword:$("#newPassword").val(),
            			},
            			error:function(response){
            				alert("error");
            			},
            			success:function(response){
            				if(response.success){
            					window.location.href="/Demo/student/thingManage.jsp";
            				}else {
            					alert(response.success);
            				}
            			}
            			
            		});
			}
	});
	
})
</script> 
 <!-- <script type="text/javascript" src="/Demo/js/changePassword.js"></script>  -->
</body>
</html>