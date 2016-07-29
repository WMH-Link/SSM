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

	<div class="widget">
		<div class="widget-content">
			<div class="tabbable">
				<br />
				<div class="tab-content">
					<div class="tab-pane active">
						<div id="edit-profile" class="form-horizontal">
							<fieldset>
								<input id="studentName" type="hidden" value="${student.studentname}"
									name="studentName">
								<div class="control-group">
									<label class="control-label">反馈内容</label>
									<div class="controls">
										<textarea rows="6" style="width: 400px" class="input-medium disabled"
											id="feedContent" name="feedContent"></textarea>
									</div>
									<!-- /controls -->
								</div>
								<br />
								<div class="control-group">
									<label class="control-label">备注</label>
									<div class="controls">
										<textarea rows="3" style="width: 400px" class="input-medium disabled" id="remarks"
											name="remarks"></textarea>
									</div>
									<!-- /controls -->
								</div>
								<!-- /control-group -->
								<br /><br />
								<div class="form-actions">
									<input type="submit" class="btn btn-primary" id="FBBtn" />

									<button class="btn" onclick="close2()">取消</button>
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
function close2(){
	window.parent.document.getElementById("tab2").click();	
}
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
            					studentName:$("#studentName").val(),
            					feedContent:$("#feedContent").val(),
            					remarks:$("#remarks").val()
            			},
            			error:function(response){
            				alert("error");
            			},
            			success:function(response){
            				$("#feedContent").val(""),
            				$("#remarks").val(""),            				
            				alert("提交成功");
            				window.parent.document.getElementById("tab2").click();
            			}
            			
            		});
			}
	});
	
})
</script> 
</body>
</html>