package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Hygiene;

/** 
 * 卫生记录Service接口
 * @author YJC
 */
public interface IHygieneService {
	/**
	 * 查询集合
	 * @param map
	 * @return
	 */
	public List<Hygiene> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加
	 * @param hygiene
	 * @return
	 */
	public int add(Hygiene hygiene);
	
	/**
	 * 修改
	 * @param hygiene
	 * @return
	 */
	public int update(Hygiene hygiene);

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Hygiene findById(String id);
	
}
