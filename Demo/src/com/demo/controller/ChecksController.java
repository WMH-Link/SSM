package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entity.Checks;
import com.demo.entity.Page;
import com.demo.service.IChecksService;
import com.demo.util.DateJsonValueProcessor;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;


/**
 * 考勤记录Controller层
 * @author YJC
 *  
 */
@Controller
@RequestMapping("/checksController")
public class ChecksController {
	@Resource
	private IChecksService checksService;
	/**
	 * 分页条件查询
	 * @param page
	 * @param rows
	 * @param check
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Checks checks,HttpServletResponse response)throws Exception{
		Page pageBean=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("checksfloor", StringUtil.formatLike(checks.getChecksfloor()));
		map.put("checksdormitoryno", StringUtil.formatLike(checks.getChecksdormitoryno()));
		map.put("checkstime", checks.getCheckstime());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Checks> List=checksService.find(map);
		Long total=checksService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray=JSONArray.fromObject(List,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 添加或者修改
	 * @param hygiene
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Checks checks,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
	
		if(checks.getChecksid()==null||checks.getChecksid().equals("")){
			checks.setChecksid(IDFactory.createId());
			resultTotal=checksService.add(checks);
		}else{
			resultTotal=checksService.update(checks);
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
	 * 删除
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			checksService.delete(idsStr[i]);
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
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
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		Checks checks=checksService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject=JSONObject.fromObject(checks, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
