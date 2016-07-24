package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.HygieneMapper;
import com.demo.entity.Hygiene;


/**
 * 卫生记录Service实现类
 * @author YJC
 */
@Service("hygieneService")
public class HygieneServiceImpl implements IHygieneService{
	
	@Resource
	private HygieneMapper dao;
	
	@Override
	public List<Hygiene> find(Map<String, Object> map) {
		return dao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return dao.getTotal(map);
	}

	@Override
	public int add(Hygiene hygiene) {
		return dao.insert(hygiene);
	}

	@Override
	public int update(Hygiene hygiene) {
		return dao.updateByPrimaryKeySelective(hygiene);
	}

	@Override
	public int delete(String id) {
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public Hygiene findById(String id) {
		return dao.selectByPrimaryKey(id);
	}

}
