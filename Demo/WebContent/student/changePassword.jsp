<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
    <link href="/Demo/css/mainPage/bootstrap.min.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/font-awesome.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/adminia.css" rel="stylesheet" /> 
    <link href="/Demo/css/mainPage/adminia-responsive.css" rel="stylesheet" />         
    <link href="/Demo/css/plans.css" rel="stylesheet" /> 
 
</head>
<body>
	<div class="widget" >
		<div class="widget-content">
			<div class="tabbable">				
				<br />
				<div class="tab-content">
					<div class="tab-pane active" >
						<div id="edit-profile" class="form-horizontal">
							<fieldset>
								<input id="studentId" type="hidden" value="${student.studentid}"
									name="studentId">
								<div class="control-group">
									<label class="control-label" for="username">Username</label>
									<div class="controls">
										<input type="text" class="input-medium disabled" id="username"
											readonly="readonly"
											value="${student.studentname}"
											disabled="">
										<p class="help-block">Your username is for logging in and
											cannot be changed.</p>
									</div>
									<!-- /controls -->
								</div>
								<!-- /control-group -->
								<div class="control-group">
									<label class="control-label">原来密码</label>
									<div class="controls">
										<input type="text" class="input-medium" id="oldPassword"
											value="" name="oldPassword" />
									</div>
									<!-- /controls -->
								</div>
								<!-- /control-group -->

								<div class="control-group">
									<label class="control-label">新密码</label>
									<div class="controls">
										<input type="text" class="input-medium" id="newPassword"
											value="" name="newPassword" />
									</div>
									<!-- /controls -->
								</div>
								<!-- /control-group -->
								<div class="control-group">
									<label class="control-label">确认密码</label>
									<div class="controls">
										<input type="text" class="input-large" id="newPassword2"
											value="" name="newPassword2" />
									</div>
									<!-- /controls -->
								</div>
								<br /><br /><br />
								<div class="form-actions">
									<input type="submit" class="btn btn-primary"
										id="updatePassword" value="提  交"/>
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
				msg = "两次密码输入错误！"; 
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
            				alert("修改成功");
            			}
            			
            		});
			}
	});
	
})
</script> 

</body>
</html>