package com.demo.service;

import java.util.List;
import java.util.Map;

import com.demo.entity.Student;

/**
 * 学生信息service
 * @author lc
 *
 */
public interface IStudentService {
	/**
	 * 查询学生集合
	 * @param map
	 * @return
	 */
	List<Student> find(Map<String, Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	 Long getTotal(Map<String,Object> map);
	/**
	 * 添加新学生信息
	 * @param student
	 * @return
	 */
	 int add(Student student);
	
	/**
	 * 修改学生信息
	 * @param student
	 * @return
	 */
	 int update(Student student);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	 Student findById(String id);
}

