package com.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.axis.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entity.Admin;
import com.demo.entity.Student;
import com.demo.service.IAdminService;
import com.demo.service.StudentService;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

/**
 * 管理员登录操作action
 * @author wangyi
 *
 */
@Controller
@RequestMapping("/LoginController")
public class LoginController {
	@Resource
	IAdminService adminService;
	@Resource
	StudentService studentService;
	public HttpServletRequest request;
	public HttpServletResponse response;
	/**
	 * 此方法在control方法执行前执行
	 * @param request
	 * @param response
	 */
	@ModelAttribute
	public void setAtrrs(HttpServletRequest request,HttpServletResponse response){
		this.request=request;
		this.response=response;
	}
	/**
	 * 管理员登录
	 * @throws IOException 
	 */
	@RequestMapping("/login")
	public void loginUser() throws IOException{
		String adminNo=request.getParameter("adminno");
		String adminPassword=request.getParameter("adminpassword");
		String adminPosition=request.getParameter("adminposition");
		//调用service
		Admin admin=new Admin();
		admin.setAdminno(adminNo);
		admin.setAdminpassword(adminPassword);
		admin.setAdminposition(adminPosition);
		boolean flag =false;
		Admin adminInfo=adminService.login(admin);
		if(adminInfo != null)
		{
			flag= true;	
		}
		//返回登录验证信息
		JSONObject json=new JSONObject();
		if(flag){
			json.accumulate("result", 1);
			json.accumulate("tip", "登录成功");
			HttpSession session=request.getSession();
			session.setAttribute("adminUser", adminInfo);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}else {
			json.accumulate("result", 0);
			json.accumulate("tip", "登录失败");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}
	}
	
	/**
	 * 管理员修改密码
	 * @param admin
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPassword")
	public String modifyPassword(String adminid, String newPassword)throws Exception{

		Admin admin=new Admin();
		System.out.println("adminid"+adminid);
		admin.setAdminid(adminid);
		admin.setAdminpassword(newPassword);
		int resultTotal=adminService.updatePassword(admin);
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 管理员注销
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/jsp/loginPage.jsp";
	}
	
	
	
	
	
	
	/**
	 * 学生登录
	 * @throws IOException 
	 */
	@RequestMapping("/loginStudent")
	public void loginStudent() throws IOException{
		String studentno=request.getParameter("studentno");
		String studentpassword=request.getParameter("studentpassword");
		//调用service
		boolean flag =false;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("studentno", studentno);
		map.put("studentpassword", studentpassword);
		List<Student> studentInfo=studentService.find(map);
		
		if(studentInfo.size()>0&&studentInfo.get(0)!=null)
		{
			flag= true;	
		}

		//返回登录验证信息
		JSONObject json=new JSONObject();
		if(flag){
			json.accumulate("result", 1);
			json.accumulate("tip", "登录成功");
			HttpSession session=request.getSession();
			session.setAttribute("student", studentInfo.get(0));
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}else {
			json.accumulate("result", 0);
			json.accumulate("tip", "登录失败");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}
	}
	
	/**
	 * 学生修改密码
	 * @param Student
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/changePass")
	public String changePassword(String studentId, String newPassword)throws Exception{

		Student student=new Student();
		System.out.println("-----------------修改密码：studetId"+studentId+",newPassword"+newPassword);
		student.setStudentid(studentId);;
		student.setStudentpassword(newPassword);;
		int resultTotal=0;
		resultTotal=studentService.update(student);
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	
}
