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
			<i class="icon-th-large"></i> 反馈管理
		</h1>

		<div class="row">
			<div class="span9">
				<div class="widget">
					<div class="widget-header">
						<h3>增加反馈</h3>
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
											<label class="control-label" >反馈内容</label>
											<div class="controls">
												<input type="text" class="input-medium disabled"
													id="feedContent" name="feedContent">
											</div>
											<!-- /controls -->
										</div>
										<div class="control-group">
											<label class="control-label" >备注</label>
											<div class="controls">
												<input type="text" class="input-medium disabled"
													id="remarks" name="remarks">
											</div>
											<!-- /controls -->
										</div>
										<!-- /control-group -->
										<br />
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" id="FBBtn" />
											
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
	$("#FBBtn").click(function(){  
            // 做表单输入校验  
		var feedContent1=$("#feedContent");
            var msg = "";  
			if($.trim(feedContent1.val())==''){
				 msg = "反馈内容不能为空！";  
				 alert(msg); 
			}
			else{
			   $.ajax({
            			url:"/Demo/FeedbackController/addFB.do",
            			type:"post",
            			dataType:"json",
            			data:{
            					studentId:$("#studentId").val(),
            					feedContent:$("#feedContent").val(),
            					remarks:$("#remarks").val()
            			},
            			error:function(response){
            				alert("error");
            			},
            			success:function(response){
            				if(response.result==1){
            					window.location.href="/Demo/student/thingManage.jsp";
            				}else {
            					alert(response.tip);
            				}
            			}
            			
            		});
			}
	});
	
})
</script> 
</body>
</html>