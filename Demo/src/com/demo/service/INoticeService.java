package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Notice;

/**
 * 公告管理Service接口
 * @author 廖明兴
 *
 */
public interface INoticeService {
	/**
	 * 查询公告集合
	 * @param map
	 * @return
	 */
	public List<Notice> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加公告
	 * @param saleChance
	 * @return
	 */
	public int add(Notice notice);
	
	/**
	 * 修改公告
	 * @param repair
	 * @return
	 */
	public int update(Notice notice);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Notice findById(Integer id);
}
