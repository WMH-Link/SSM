
$(function(){
	$("#login").click(function(){
		$.ajax({
			url:"UserController/login.do",
			type:"post",
			dataType:"json",
			data:{
				email:$("#email").val(),
				password:$("#password").val()
			},
			error:function(response){
				alert("error");
			},
			success:function(response){
				if(response.result==1){
					window.location.href="jsp/main.jsp";
				}else {
					alert(response.tip);
				}
			}
			
		});
	});

})



