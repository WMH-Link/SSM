<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../bootstrap/css/bootstrap.css" type="text/css"
	rel="stylesheet">
<link href="../bootstrap/css/sb-admin-2.css" type="text/css"
	rel="stylesheet">
<link href="../bootstrap/css/font-awesome.css" type="text/css"
	rel="stylesheet">
<link href="../bootstrap/css/dataTables.bootstrap.css" type="text/css"
	rel="stylesheet">
<!-- MetisMenu CSS -->
 <link href="../bootstrap/css/metisMenu.css" rel="stylesheet">
<link href="../css/main.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>


<title>首页</title>

</head>
<body>
	<div id="wrapper">
	 	<!-- Navigation -->
       <!--  <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">my project</a>
         	</div>
         </nav> -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
				<div>
					<div class="header">
						<a href="http://www.baidu.com"><span> my project</span></a>
					</div>

					<div class="header_right">

						<ul class="nav nav-pills">
							<li class="active">
								<!--  <a href="#">首页</a>  -->
								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown"><i
										class="glyphicon glyphicon-envelope"></i><span class="caret"></span></a>
									<ul id="message" class="dropdown-menu  pull-right">
										<li>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="active">
								<!--  <a href="#">首页</a>  -->
								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown"><i
										class="glyphicon glyphicon-tasks"></i><span class="caret"></span></a>
									<ul id="message" class="dropdown-menu   pull-right">
										<li>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="active">
								<!--  <a href="#">首页</a>  -->
								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown"><i
										class="glyphicon glyphicon-bell"></i><span class="caret"></span></a>
									<ul id="message" class="dropdown-menu   pull-right">
										<li>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
											<hr>
											<div>
												<div>
													<strong>zhang san</strong> <span class="span">
														yesterday</span>
												</div>
												<div>Lorem ipsum dolor sit amet, consectetur
													adipiscing elit. Pellentesque eleifend...</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="navbar-default sidebar" role="navigation"
						style="margin-top: 5%;">
						<div class="sidebar-nav navbar-collapse">
							<ul class="nav" id="side-menu">
								<li class="sidebar-search"><div
										class="input-group custom-search-form">
										<input type="text" class="form-control"
											placeholder="Search..."> <span
											class="input-group-btn">
											<button class="btn btn-default" type="button">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-glass"></i> Dashboard</a></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
								<li><a href="index.html"><i
										class="glyphicon glyphicon-heart"></i> 随便<span
										class="fa arrow "
										style="float: right; line-height: 14px; display: inline;"></span></a>
									<ul class="nav nav-second-level collapse">
										<li><a>second-level</a></li>
										<li><a>second-level</a></li>

									</ul></li>
							</ul>
						</div>
					</div>
					</div>
			</nav>
		<div id="page-wrapper" style="min-height: 429px;">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page1-header">page-wrapper</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<div class="panel1">
						<div class="panel1-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-apple fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge1">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel1-footer">
								<span> View Details</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
							</div>

						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<div class="panel1">
						<div class="panel1-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-apple fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge1">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel1-footer">
								<span> View Details</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
							</div>

						</a>
					</div>

				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<div class="panel1">
						<div class="panel1-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-apple fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge1">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel1-footer">
								<span> View Details</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
							</div>

						</a>
					</div>

				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<div class="panel1">
						<div class="panel1-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-apple fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge1">26</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="#">
							<div class="panel1-footer">
								<span> View Details</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
							</div>

						</a>
					</div>

				</div>
			</div>
			<div class="row" style="margin-top: 10px;">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">DataTables Advanced Tables</div>
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<div id="dataTables-example_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap no-footer">
									<div class="row">
										<div class="col-sm-6 col-xs-12">
											<div class="dataTables_length" id="dataTables-example_length">
												<label>Show <select name="dataTables-example_length"
													aria-controls="dataTables-example"
													class="form-control input-sm"><option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option></select> entries
												</label>
											</div>
										</div>
										<div class="col-sm-6 col-xs-12 text-right">
											<div class="dataTables_length" id="dataTables-example_length">
												<label>Show <select name="dataTables-example_length"
													aria-controls="dataTables-example"
													class="form-control input-sm"><option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option></select> entries
												</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sx-12">									
											<table class="table  table-hover">
												<thead>
													<tr>
														<th>学号</th>
														<th>姓名</th>
														<th>性别</th>
														<th>班级</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>007</td>
														<td>张三</td>
														<td>男</td>
														<td>三年2班</td>
													</tr>
													<tr>
														<td>007</td>
														<td>张三</td>
														<td>男</td>
														<td>三年2班</td>
													</tr>
													<tr>
														<td>007</td>
														<td>张三</td>
														<td>男</td>
														<td>三年2班</td>
													</tr>
													<tr>
														<td>007</td>
														<td>张三</td>
														<td>男</td>
														<td>三年2班</td>
													</tr>
													<tr>
														<td>007</td>
														<td>张三</td>
														<td>男</td>
														<td>三年2班</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
										 </div>
										<div class="col-sm-6 text-right">
											<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
												<ul class="pagination">
													<li>上一页</li>
													<li>1</li>
													<li>2</li>
													<li>3</li>
													<li>下一页</li>
												</ul>
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
	</div>
</body>

<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="../bootstrap/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap/js/sb-admin-2.js"></script>
<script type="text/javascript" src="../bootstrap/js/metisMenu.js"></script>
</html>
