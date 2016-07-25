package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.ChecksMapper;
import com.demo.entity.Checks;

/** 
 * 考勤记录Service实现类
 * @author YJC
 */
@Service("checksService")
public class ChecksServiceImpl implements IChecksService{
	
	@Resource
	private ChecksMapper dao;
	
	@Override
	public List<Checks> find(Map<String, Object> map) {
		return dao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return dao.getTotal(map);
	}

	@Override
	public int add(Checks checks) {
		return dao.insert(checks);
	}

	@Override
	public int update(Checks checks) {
		return dao.updateByPrimaryKeySelective(checks);
	}

	@Override
	public int delete(String id) {
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public Checks findById(String id) {
		return dao.selectByPrimaryKey(id);
	}

}
