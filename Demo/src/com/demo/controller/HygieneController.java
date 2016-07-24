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

import com.demo.entity.Hygiene;
import com.demo.entity.Page;
import com.demo.service.IHygieneService;
import com.demo.util.DateJsonValueProcessor;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;


/**
 * 卫生记录Controller层
 * @author YJC
 *
 */
@Controller
@RequestMapping("/hygieneController")
public class HygieneController {
	@Resource
	private IHygieneService hygieneService;
	/**
	 * 分页条件查询销售机会
	 * @param page
	 * @param rows
	 * @param s_saleChance
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Hygiene hygiene,HttpServletResponse response)throws Exception{
		Page pageBean=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("hygienefloor", StringUtil.formatLike(hygiene.getHygienefloor()));
		map.put("hygienedormitoryno", StringUtil.formatLike(hygiene.getHygienedormitoryno()));
		map.put("hygienegrade", hygiene.getHygienegrade());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Hygiene> List=hygieneService.find(map);
		Long total=hygieneService.getTotal(map);
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
	public String save(Hygiene hygiene,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
	
		if(hygiene.getHygieneid()==null||hygiene.getHygieneid().equals("")){
			hygiene.setHygieneid(IDFactory.createId());
			resultTotal=hygieneService.add(hygiene);
		}else{
			resultTotal=hygieneService.update(hygiene);
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
			hygieneService.delete(idsStr[i]);
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
		Hygiene hygiene=hygieneService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject=JSONObject.fromObject(hygiene, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
