package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;





import com.demo.entity.Page;
import com.demo.entity.Student;
import com.demo.service.StudentService;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

import freemarker.template.utility.DateUtil;


/**
 * 学生信息管理
 * @author lc
 * 
 */

@Controller
@RequestMapping("/studentController")
public class StudentController {
	
	@Resource
	private StudentService studentService;
	
	
	/**
	 * 分页条件查询学生
	 * @param page
	 * @param rows
	 * @param s_customer
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Student student,HttpServletResponse response)throws Exception{
		System.out.println("查找--------------list------");
		Page pageBean=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("studentno", StringUtil.formatLike(student.getStudentno()));
		map.put("studentpassword", StringUtil.formatLike(student.getStudentpassword()));
		map.put("studentname", StringUtil.formatLike(student.getStudentname()));
		map.put("studentsex", StringUtil.formatLike(student.getStudentsex()));
		map.put("studentfoor", StringUtil.formatLike(student.getStudentfoor()));
		map.put("studentdormitoryno", StringUtil.formatLike(student.getStudentdormitoryno()));
		map.put("studentbed", StringUtil.formatLike(student.getStudentbed()));
		map.put("studentage", StringUtil.formatLike(student.getStudentage()));
		
		map.put("studentphone", StringUtil.formatLike(student.getStudentphone()));
		map.put("studentmajor", StringUtil.formatLike(student.getStudentmajor()));
		
		map.put("studentcollege", StringUtil.formatLike(student.getStudentcollege()));
		
		map.put("studenttime",StringUtil.formatLike( student.getStudenttime()));
		map.put("remarks;;", StringUtil.formatLike(student.getRemarks()));
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Student> List=studentService.find(map);
		Long total=studentService.getTotal(map);
		
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(List);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或者修改客户
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Student student,HttpServletResponse response)throws Exception{
		System.out.println("保存--------------------");
		int resultTotal=0; // 操作的记录条数
		if(student.getStudentid()==null){
			student.setStudentid(IDFactory.createId()); // 动态生成学生编号
			resultTotal=studentService.add(student);
		}else{
			resultTotal=studentService.update(student);
		}
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
	 * 通过ID查找实体
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response,HttpServletRequest r)throws Exception{
		System.out.println("查找---id-----------------" + id);
		Student student = studentService.findById(id);
		System.out.println(student.getStudentage()+""+student.getStudentno()+""+student.getStudentname());
		System.out.println("查找---student-----------------");
	//	JSONObject jsonObject=JSONObject.fromObject(student);
		HttpSession session=r.getSession();
		session.setAttribute("student", student);
	/*	System.out.println(jsonObject.get(1)+"+"+jsonObject.get(2));
		ResponseUtil.write(response, jsonObject);
*/		return null;
	}
	
}
