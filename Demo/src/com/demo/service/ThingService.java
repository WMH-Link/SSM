package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Thing;

/**
 * 
 * @author jialiang
 *
 */
public interface ThingService {
	/**
	 * 查询物品集合
	 * @param map
	 * @return
	 */
	List<Thing> find(Map<String, Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	 Long getTotal(Map<String,Object> map);
	/**
	 * 添加新物品
	 * @param thing
	 * @return
	 */
	 int add(Thing thing);
	
	/**
	 * 修改物品
	 * @param thing
	 * @return
	 */
	 int update(Thing thing);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	Thing findById(Integer id);
}
