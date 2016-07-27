
$(function(){
	$("#login").click(function(){  

            // 做表单输入校验  
            var userId = $("#AccountUserNo");  
            var password = $("#AccountPassword");  
            var type = $("#AccountType");  
            var no=0;
            var msg = "";  
            if ($.trim(userId.val()) == ""){  
                msg = "用户名不能为空！";  
                userId.focus();  
            }else if (!/^\w{5,20}$/.test($.trim(userId.val()))){  
                msg = "用户名格式不正确！";  
                userId.focus();  
            }else if ($.trim(password.val()) == ""){  
                msg = "密码不能为空！";  
                password.focus();  
            }
            else if ($.trim(type.val()) == ""){  
                msg = "请选择类型";  
                type.focus();  
            }
            if (msg != ""){  
                alert(msg);  
            }else
            {  
            	if($.trim(type.val())=="学生")
            	{
            		$.ajax({
            			url:"/Demo/LoginController/loginStudent.do",
            			type:"post",
            			dataType:"json",
            			data:{
            				studentno:$("#AccountUserNo").val(),
            				studentpassword:$("#AccountPassword").val(),
            			},
            			error:function(response){
            				alert("error");
            			},
            			success:function(response){
            				if(response.result==1){
            					window.location.href="/Demo/student/main.jsp";
            				}else {
            					alert(response.tip);
            				}
            			}
            			
            		});
            	}
            	else
            	{
            		$.ajax({
            			url:"/Demo/LoginController/login.do",
            			type:"post",
            			dataType:"json",
            			data:{
    	        				adminno:$("#AccountUserNo").val(),
    	        				adminpassword:$("#AccountPassword").val(),
    	        				adminposition:$("#AccountType").val()
            			},
            			error:function(response){
            				alert("error");
            			},
            			success:function(response){
            				if(response.result==1){
            					window.location.href="/Demo/page/backgroundPage.jsp";
            				}else {
            					alert(response.tip);
            				}
            			}
            			
            		});
            	}
            	
            }
	});
	
})








