<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" >
<link rel="stylesheet" type="text/css" href="bootstrap/css/font-awesome.css" >
<link rel="stylesheet" type="text/css" href="bootstrap/css/sb-admin-2.css" >
<script type="text/javascript" src="bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<title>用户登录</title>
</head>
<body>
	<div id="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method="post" >
							<fieldset >
								<div class="form-group">
								<div class="row">
									<div class="col-xs-8">
										<input class="form-control" placeholder="E-mail" id="email"
											name="email" type="email" autofocus>
									</div>
									<div class="col-xs-4 ">
										<label style="color: red;">*为必填</label>
									</div>
									</div>
								</div>
								<div class="form-group" style="margin-top: 40px">
								<div class="row">
									<div class="col-xs-8">
										<input class="form-control" placeholder="password" id="password"
											name="password" type="password" >
									</div>
									<div class="col-xs-4 ">
										<label style="color: red;">*为必填</label>
									</div>
									</div>
								</div>
								
								<div class="checkbox"  style="margin-top: 40px;margin-left: 4%">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<div  class="col-xs-8">
									<input id="login" value="login" class="btn btn-lg btn-success btn-block" style="margin-top: 20px;"/>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>