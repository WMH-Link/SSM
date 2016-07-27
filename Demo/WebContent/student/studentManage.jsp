<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

				
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					User Account					
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<h3>Basic Information</h3>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								
								
								
								<div class="tabbable">
						<ul class="nav nav-tabs">
						  <li class="active">
						    <a href="#1" data-toggle="tab">Profile</a>
						  </li>
						  <li><a href="#2" data-toggle="tab">Settings</a></li>
						</ul>
						
						<br />
						
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								<form id="edit-profile" class="form-horizontal" />
									<fieldset>
										
										<div class="control-group">											
											<label class="control-label" for="username">Username</label>
											<div class="controls">
												<input type="text" class="input-medium disabled" id="username" value="goideate" disabled="" />
												<p class="help-block">Your username is for logging in and cannot be changed.</p>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="firstname">First Name</label>
											<div class="controls">
												<input type="text" class="input-medium" id="firstname" value="Rod" />
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="lastname">Last Name</label>
											<div class="controls">
												<input type="text" class="input-medium" id="lastname" value="Howard" />
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="email">Email Address</label>
											<div class="controls">
												<input type="text" class="input-large" id="email" value="rod.howard@example.com" />
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<br /><br />
										
										<div class="control-group">											
											<label class="control-label" for="password1">Password</label>
											<div class="controls">
												<input type="password" class="input-medium" id="password1" value="password" />
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="password2">Confirm</label>
											<div class="controls">
												<input type="password" class="input-medium" id="password2" value="password" />
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
											
											<br />
										
											
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">Save</button> 
											<button class="btn">Cancel</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
								</div>
								
								<div class="tab-pane" id="2">
									<form id="edit-profile2" class="form-horizontal" />
										<fieldset>
											
											
											<div class="control-group">
												<label class="control-label" for="accounttype">Account Type</label>
												<div class="controls">
													<label class="radio">
														<input type="radio" name="accounttype" value="option1" checked="checked" id="accounttype" />
														POP3
													</label>
													<label class="radio">
														<input type="radio" name="accounttype" value="option2" />
														IMAP
													</label>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="accountusername">Account Username</label>
												<div class="controls">
													<input type="text" class="input-large" id="accountusername" value="rod.howard@example.com" />
													<p class="help-block">Leave blank to use your profile email address.</p>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="emailserver">Email Server</label>
												<div class="controls">
													<input type="text" class="input-large" id="emailserver" value="mail.example.com" />
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="accountpassword">Password</label>
												<div class="controls">
													<input type="text" class="input-large" id="accountpassword" value="password" />
												</div>
											</div>
											
																						
											
											
											<div class="control-group">
												<label class="control-label" for="accountadvanced">Advanced Settings</label>
												<div class="controls">
													<label class="checkbox">
														<input type="checkbox" name="accountadvanced" value="option1" checked="checked" id="accountadvanced" />
														User encrypted connection when accessing this server
													</label>
													<label class="checkbox">
														<input type="checkbox" name="accounttype" value="option2" />
														Download all message on connection
													</label>
												</div>
											</div>

											
											<br />
											
											<div class="form-actions">
												<button type="submit" class="btn btn-primary">Save</button> <button class="btn">Cancel</button>
											</div>
										</fieldset>
									</form>
								</div>
								
							</div>
						  
						  
						</div>
								
								
								
								
								
								
								
								
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
				
				
				
				
				
				
				
				
			</div> <!-- /span9 -->
	

</body>
</html>