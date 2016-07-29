package com.demo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entity.Admin;
import com.demo.entity.Feedback;
import com.demo.entity.PageBean;
import com.demo.service.IFeedbackService;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

/**
 * 后台反馈管理操作action
 * @author wangyi
 *
 */
@Controller
@RequestMapping("/FeedbackController")
public class FeedbackController {
	@Resource
	IFeedbackService feedbackService;
	
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
	 * 分页条件查询用户
	 * @param page
	 * @param rows
	 * @param s_user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String noticetime)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("noticetime", noticetime);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Feedback> feedbackList=feedbackService.find(map);
		Long total=feedbackService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(feedbackList);
	
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 新增反馈
	 *
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/addFB")
	public void feedbackAdd(String studentId,String feedContent,String remarks) throws IOException
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String time=df.format(new Date());
		String studentname=request.getParameter("studentName");
		String feedcontent=request.getParameter("feedContent");

		//调用service
		Feedback feedback=new Feedback();
		feedback.setFeedbackid(IDFactory.createId());
		feedback.setNoticecontent(feedcontent);
		feedback.setNoticepeople(studentname);
		feedback.setRemarks(remarks);
		feedback.setNoticetime(time);
		int flag=feedbackService.add(feedback);
		//返回登录验证信息
		JSONObject json=new JSONObject();
		if(flag>0){
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
	

}
