package com.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.service.IRepairService;
import com.demo.controller.DateJsonValueProcessor;
import com.demo.entity.Page;
import com.demo.entity.Repair;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

/**
 * 报修管理Controller层
 * 
 * @author 廖明兴
 *
 */
@Controller
@RequestMapping("/Repair")
public class RepairController {
	@Resource
	private IRepairService repairService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true)); // true:允许输入空值，false:不能为空值
	}

	/**
	 * 分页条件查询报修记录
	 * 
	 * @param page
	 * @param rows
	 * @param s_repair
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			Repair s_repair, HttpServletResponse response) throws Exception {
		Page pageBean=new Page(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repairid", StringUtil.formatLike(s_repair.getRepairid()));
		map.put("repairfloor", StringUtil.formatLike(s_repair.getRepairfloor()));
		map.put("repairdormitoryno",
				StringUtil.formatLike(s_repair.getRepairdormitoryno()));
		map.put("thingid", s_repair.getThingid());
		map.put("repaircontent", s_repair.getRepaircontent());
		map.put("repairtime", s_repair.getRepairtime());
		map.put("repairdotime", s_repair.getRepairdotime());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Repair> repairList = repairService.find(map);
		Long total = repairService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(repairList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 修改报修记录
	 * 
	 * @param repair
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Repair repair, HttpServletResponse response)
			throws Exception {

		return null;
	}

	/**
	 * 通过ID查找实体
	 * 
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value = "repairid") String id,
			HttpServletResponse response) throws Exception {
		Repair repair = repairService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject = JSONObject.fromObject(repair, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
