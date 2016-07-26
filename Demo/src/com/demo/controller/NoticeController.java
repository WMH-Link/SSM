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

import com.demo.entity.Notice;
import com.demo.controller.DateJsonValueProcessor;
import com.demo.entity.Page;
import com.demo.service.INoticeService;
import com.demo.util.IDFactory;
import com.demo.util.ResponseUtil;
import com.demo.util.StringUtil;

/**
 * 公告管理Controller层
 * 
 * @author 廖明兴
 *
 */
@Controller
@RequestMapping("/Notice")
public class NoticeController {
	@Resource
	private INoticeService noticeService;

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
			Notice s_notice, HttpServletResponse response) throws Exception {
		Page pageBean = new Page(Integer.parseInt(page), Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeid", StringUtil.formatLike(s_notice.getNoticeid()));
		map.put("noticetype", StringUtil.formatLike(s_notice.getNoticetype()));
		map.put("noticetitle",StringUtil.formatLike(s_notice.getNoticetitle()));
		map.put("noticeauthor", s_notice.getNoticeauthor());
		map.put("noticecontent", s_notice.getNoticecontent());
		map.put("noticetime", s_notice.getNoticetime());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Notice> noticeList = noticeService.find(map);
		Long total = noticeService.getTotal(map);
		
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray = JSONArray.fromObject(noticeList, jsonConfig);
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
	public String save(Notice notice, HttpServletResponse response)
			throws Exception {
		int resultTotal = 0; // 操作的记录条数

		if (notice.getNoticeid() == null || notice.getNoticeid().equals("")) {
			notice.setNoticeid(IDFactory.createId());
			resultTotal = noticeService.add(notice);
		} else {
			String str = notice.getNoticeid();
			String arr[] = str.split(",");
			notice.setNoticeid(arr[0]);
			resultTotal = noticeService.update(notice);
		}

		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
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
	public String findById(@RequestParam(value = "noticeid") String id,
			HttpServletResponse response) throws Exception {
		Notice notice = noticeService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject = JSONObject.fromObject(notice, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
