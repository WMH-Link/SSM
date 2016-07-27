package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.FeedbackMapper;
import com.demo.entity.Feedback;

@Service
public class FeedbackServiceImpl implements IFeedbackService{
	@Resource
	FeedbackMapper feedbackMapper;
	/**
	 * 查询反馈信息集合
	 * @param map
	 * @return
	 */
	public List<Feedback> find(Map<String,Object> map) {
		return feedbackMapper.find(map);
	}
	
	@Override
	public Long getTotal(Map<String, Object> map) {
		return feedbackMapper.getTotal(map);
	}

	@Override
	public int add(Feedback feeb) {
		// TODO Auto-generated method stub
		return feedbackMapper.add(feeb);
	}

}
