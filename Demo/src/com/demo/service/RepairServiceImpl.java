package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.entity.Repair;
import com.demo.dao.RepairMapper;

/**
 * 报修管理Service实现类
 * @author 廖明兴
 *
 */
@Service("IRepairService")
public class RepairServiceImpl implements  IRepairService{
	@Resource
	private RepairMapper repairMapper;

	@Override
	public List<Repair> find(Map<String, Object> map) {
		return repairMapper.find(map);
	}
	
	@Override
	public Long getTotal(Map<String, Object> map) {
		return repairMapper.getTotal(map);
	}

	@Override
	public int add(Repair saleChance) {
		return repairMapper.add(saleChance);
	}

	@Override
	public Repair findById(Integer id) {
		return repairMapper.findById(id);
	}
}
