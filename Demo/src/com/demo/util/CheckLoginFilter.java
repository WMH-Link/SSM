package com.demo.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.entity.Admin;
import com.demo.entity.Student;

public class CheckLoginFilter implements Filter  
{        
    public void init(FilterConfig arg0) throws ServletException {  
    	
    }  
  
    public void doFilter(ServletRequest arg0,   
            ServletResponse arg1,   
            FilterChain arg2)   
            throws IOException, ServletException {  
  
        HttpServletRequest request = (HttpServletRequest)arg0;  
        HttpServletResponse response = (HttpServletResponse) arg1;  
        Student student = (Student) request.getSession().getAttribute("student");  
        Admin adminUser = (Admin) request.getSession().getAttribute("adminUser");
        if(student==null||adminUser==null){  
            response.sendRedirect(request.getContextPath()+"/jsp/loginPage.jsp");  //返回重新登录界面  
            return;  
        }          
        arg2.doFilter(arg0,arg1);  
    }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}  
      
}
