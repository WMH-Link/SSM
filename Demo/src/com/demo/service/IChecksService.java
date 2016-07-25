package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Checks;


/** 
 * 考勤记录Service接口
 * @author YJC
 */
public interface IChecksService {
	/**
	 * 查询集合
	 * @param map
	 * @return
	 */
	public List<Checks> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加
	 * @param check
	 * @return
	 */
	public int add(Checks checks);
	
	/**
	 * 修改
	 * @param check
	 * @return
	 */
	public int update(Checks checks);

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
	public Checks findById(String id);
	
}
