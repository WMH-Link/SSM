package com.demo.controller;

import java.io.IOException;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entity.User;
import com.demo.service.IUserService;

import net.sf.json.JSONObject;

/**
 * 用户操作action
 * @author hshuai
 *
 */
@Controller
@RequestMapping("/UserController")
public class UserController {
	@Resource
	IUserService userService;
	
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
	 * 用户登录
	 * @throws IOException 
	 */
	@RequestMapping("/login")
	public void loginUser() throws IOException{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println("email="+email+",password="+password);
		//调用service
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		boolean flag=userService.login(user);
				
		//返回登录验证信息
		JSONObject json=new JSONObject();
		if(flag){
			json.accumulate("result", 1);
			json.accumulate("tip", "登录成功");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}else {
			json.accumulate("result", 0);
			json.accumulate("tip", "登录失败");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}
	}
	
	@RequestMapping("/register")
	public void register() throws IOException{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println("email="+email+",password="+password);
		//调用service
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		System.out.println("注册");
		boolean flag=userService.register(user);
				
		//返回登录验证信息
		JSONObject json=new JSONObject();
		if(flag){
			json.accumulate("result", 1);
			json.accumulate("tip", "注册成功");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}else {
			json.accumulate("result", 0);
			json.accumulate("tip", "注册失败");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(json.toString());
		}
	}
}
