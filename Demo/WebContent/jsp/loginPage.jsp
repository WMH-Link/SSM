<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录界面</title>
    
    <link href="/Demo/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/Demo/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />       
    <link href="/Demo/bootstrap/css/font-awesome.css" rel="stylesheet" />
    
    <link href="/Demo/css/mainPage/adminia.css" rel="stylesheet" /> 
    <link href="/Demo/css/mainPage/adminia-responsive.css" rel="stylesheet" /> 
    
    <link href="/Demo/css/login.css" rel="stylesheet" /> 

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
  </head>

<body>
	
<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			<a class="brand" >Dormitory ManageSystem</a>
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->


<div id="login-container">
	
	
	<div id="login-header">
		
		<h3>Login</h3>
		
	</div> <!-- /login-header -->
	
	<div id="login-content" class="clearfix">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="userName">登录账号</label>
						<div class="controls">
							<input type="text" class="" id="AccountUserName" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">登录密码</label>
						<div class="controls">
							<input type="password" class="" id="AccountPassword" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" ></label>
						<div class="controls">
							<select id="AccountType" name="AccountType" style="width:100% ; height:100%" >
				                	<option value="">请选择用户类型...</option>
				                	<option value="学生">学生</option>
									<option value="寝室管理员">寝室管理员</option>
									<option value="寝室记录员">寝室记录员</option>
			                </select>
						</div>
					</div>
				</fieldset>
			
				
				<div class="pull-right">
					<button type="submit" id="login" class="btn btn-warning btn-large">
						登录
					</button>
					<!-- <input id="login" value="登录" class="btn btn-warning btn-large"  /> -->
				</div>	
		</div> <!-- /login-content -->
		
		
	
</div> <!-- /login-wrapper -->

<!-- Placed at the end of the document so the pages load faster -->
<script src="/Demo/bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="/Demo/js/login.js"></script>
<script src="/Demo/bootstrap/js/bootstrap.js"></script>

  </body>
</html>
