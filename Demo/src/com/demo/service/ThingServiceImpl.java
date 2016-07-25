package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.ThingMapper;
import com.demo.entity.Thing;
/**
 * 
 * @author jialiang
 *
 */
@Service
public class ThingServiceImpl implements ThingService{
	
	@Resource
	ThingMapper thingMapper;

	@Override
	public List<Thing> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return thingMapper.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return thingMapper.getTotal(map);
	}

	@Override
	public Thing findById(Integer id) {
		// TODO Auto-generated method stub
		return thingMapper.findById(id);
	}

	@Override
	public int add(Thing thing) {
		// TODO Auto-generated method stub
		return thingMapper.add(thing);
	}

	@Override
	public int update(Thing thing) {
		// TODO Auto-generated method stub
		return thingMapper.update(thing);
	}



	

}
