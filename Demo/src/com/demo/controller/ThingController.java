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






import com.demo.entity.Page;
import com.demo.entity.Thing;
import com.demo.service.ThingService;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

@Controller
@RequestMapping("/thing")
/**
 * 
 * @author jialiang
 *
 */
public class ThingController {

	@Resource
	private ThingService thingService;
	
//	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		dateFormat.setLenient(false);
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
//	}
	 
	/**
	 * 分页条件查询销售机会
	 * @param page
	 * @param rows
	 * @param thing
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,Thing thing,HttpServletResponse response)throws Exception{
		Page pageBean=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("thingno", StringUtil.formatLike(thing.getthingno()));
		map.put("thingname", StringUtil.formatLike(thing.getthingname()));
		map.put("thingtype", StringUtil.formatLike(thing.getthingtype()));
		map.put("thingstate", thing.getthingstate());
		map.put("thingdormitory", thing.getthingdormitory());
		map.put("remark", thing.getRemark());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Thing> saleChanceList=thingService.find(map);
		Long total=thingService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray=JSONArray.fromObject(saleChanceList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 新增物品信息
	 * @param thing
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Thing thing,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		
		System.out.println(thing.getthingid()==null);
		if(thing.getthingid()==null || thing.getthingid().equals("")){
			thing.setthingid(IDFactory.createId());
			resultTotal=thingService.add(thing);
		}
		else {
			System.out.print(thing.getthingname());
			resultTotal=thingService.update(thing);
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
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		Thing saleChance=thingService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject=JSONObject.fromObject(saleChance, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
