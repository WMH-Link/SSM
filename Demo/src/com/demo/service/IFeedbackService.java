package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Feedback;

/**
 * @author 汪毅
 *
 */
public interface IFeedbackService {
	/**
	 * 查询反馈信息集合
	 * @param map
	 * @return
	 */
	public List<Feedback> find(Map<String,Object> map);
	/**
	 * 查询反馈信息总条数集合
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String, Object> map);
	/**
	 * 增加反馈信息
	 * @param Feedback
	 * @return
	 */
	public int add(Feedback feeb);

}