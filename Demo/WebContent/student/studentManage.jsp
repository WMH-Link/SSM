<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
    <link href="/Demo/css/mainPage/bootstrap.min.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/font-awesome.css" rel="stylesheet" />
    <link href="/Demo/css/mainPage/adminia.css" rel="stylesheet" /> 
    <link href="/Demo/css/mainPage/adminia-responsive.css" rel="stylesheet" />         
    <link href="/Demo/css/plans.css" rel="stylesheet" /> 
 
<body>
	<div class="widget" >
		<div class="widget-content">
			<div class="tabbable">				
				<br />
				<div class="tab-content">
					<div class="tab-pane active" >
						<div id="edit-profile" class="form-horizontal" style="">
							<fieldset>
								<div class="control-group" style="padding-left: 60px">
									学号: &nbsp;									
										<input type="text" class="input-medium disabled" id="studentno"
											value="${student.studentno}" disabled="" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
									姓名: &nbsp;										
										<input type="text" class="input-medium disabled" id="studentname"
											value="${student.studentname}" disabled="" />									
								</div>								
								
								<div class="control-group" style="padding-left: 60px">
									性别: &nbsp;									
										<input type="text" class="input-medium disabled" id="studentsex"
											value="${student.studentsex}" disabled="" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
									年龄: &nbsp;									
										<input type="text" class="input-medium disabled" id="studentage"
											value="${student.studentage}" disabled="" />									
								</div>
										
																
								<div class="control-group" style="padding-left: 60px">
									学院: &nbsp;									
										<input type="text" class="input-medium disabled"
											id="studentcollege" value="${student.studentcollege}" disabled="" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
									专业: &nbsp;									
										<input type="text" class="input-medium disabled" id="studentmajor"
											value="${student.studentmajor}" disabled="" />
								</div>
								
								<div class="control-group" style="padding-left: 60px">
									电话: &nbsp;
										<input type="text" class="input-medium disabled" id="studentphone"
											value="${student.studentphone}" disabled="" />
									&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;		
									入学: &nbsp;
										<input type="text" class="input-medium disabled" id="studenttime"
											value="${student.studenttime}" disabled="" />
								</div>
								<div class="control-group" style="padding-left: 60px">
									楼号: &nbsp;								
										<input type="text" class="input-medium disabled"
											id="studentfoor" value="${student.studentfoor}"
											disabled="" />
											&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
									宿舍: &nbsp;								
										<input type="text" class="input-medium disabled"
											id="studentdormitoryno" value="${student.studentdormitoryno}"
											disabled="" />																
								</div>
								<div class="control-group" style="padding-left: 60px">
									床号: &nbsp;
										<input type="text" class="input-medium disabled" id="studentbed"
											value="${student.studentbed}" disabled="" />																
								</div>
								<br/>
								<br/>
								<br/>
								<br/>
								<!-- <div class="form-actions">
									<button type="submit" class="btn btn-primary">保存</button>
									<button class="btn">取消</button>
								</div> -->
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>