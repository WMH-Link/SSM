package com.demo.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * baseServlet作为一个基础servlet,所有的servlet都要继承该类
 * @author hshuai
 *
 */
public class BaseServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2464548113968179954L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取执行方法的类名
		String uri=req.getRequestURI();
		System.out.println("uri="+uri);
		String servletName=uri.substring(11, uri.length()-10)+"Servlet";
		//首字符转为大写
		char[] sn=servletName.toCharArray();
		sn[0]-=32;
	    servletName= "com.chinasoft.servlet."+String.valueOf(sn);
				
		//获取执行方法名
		String cmd=req.getParameter("cmd");
		//执行默认方法
		if(null==cmd || cmd.equals("")){
			cmd="excute";
		}
		System.out.println("servlet:"+servletName+" , "+cmd);		
		try {
			//通过反射拿到servlet对象
			Object obj=Class.forName(servletName).newInstance();	
			//通过反射获得当前运行类中指定的方法，方法的参数类型
			Method excuteMethod=obj.getClass().getMethod(cmd, HttpServletRequest.class,HttpServletResponse.class);			
			//反射的执行方法，实际的参数
			excuteMethod.invoke(obj, req,resp);
			
		} catch (NoSuchMethodException e) {
			throw new RuntimeException("执行的方法"+cmd+"不存在");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException("服务器异常",e);
		} 
	}
	
	

}
