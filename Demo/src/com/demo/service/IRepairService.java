package com.demo.service;

import com.demo.entity.Repair;

public interface IRepairService {
	/**
	 * 报修记录查询方法
	 * @param repair
	 * @return
	 */
	Repair query(Repair repair);
	
	/**
	 * 报修记录新增方法
	 * @param repair
	 * @return
	 */
	Repair add(Repair repair);
}
