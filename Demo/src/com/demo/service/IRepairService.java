package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Repair;

/**
 * 报修管理Service接口
 * @author 廖明兴
 *
 */
public interface IRepairService {
	/**
	 * 查询报修管理集合
	 * @param map
	 * @return
	 */
	public List<Repair> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加报修记录
	 * @param saleChance
	 * @return
	 */
	public int add(Repair repair);
	
	/**
	 * 修改报修记录
	 * @param repair
	 * @return
	 */
	public int update(Repair repair);
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Repair findById(Integer id);
}
