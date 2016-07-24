package com.demo.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
/**
 * 用于用户管理的servlet
 * @author hshuai
 *
 */
public class UserServlet extends BaseServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4350950074302365383L;
	/**
	 * 默认执行方法
	 * @param req
	 * @param resp
	 */
	public void excute(HttpServletRequest req, HttpServletResponse resp){
		
	}
	/**
	 * 用户登录
	 * @param req
	 * @param resp
	 * @throws IOException 
	 */
	public void loginUser(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		System.out.println("email="+email+",password="+password);
		//调用service
		
		//返回登录验证信息
		JSONObject json=new JSONObject();
		boolean flag =true;
		if(flag){
			json.accumulate("result", 1);
			json.accumulate("tip", "登录成功");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(json.toString());
//			req.getRequestDispatcher("/main.jsp").forward(req, resp);
//			resp.sendRedirect("/main.jsp");
		}else {
			json.accumulate("result", 0);
			json.accumulate("tip", "登录失败");
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().write(json.toString());
		}
		
		//跳转页面
//		req.getRequestDispatcher("main.jsp").forward(req, resp);
//		resp.sendRedirect("main.jsp");
	}
	/**
	 * 用户注册
	 * @param req
	 * @param resp
	 */
	public void registerUser(HttpServletRequest req, HttpServletResponse resp){
		
	}
	/**
	 * 修改用户
	 * @param req
	 * @param resp
	 */
	public void updateUser(HttpServletRequest req, HttpServletResponse resp){
		
	}
	

}
