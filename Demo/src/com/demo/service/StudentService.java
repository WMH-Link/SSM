package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.StudentMapper;
import com.demo.entity.Student;


/**
 * 学生信息管理Service
 * @author lc
 * 
 */
@Service("studentService")
public class StudentService implements IStudentService{

	@Resource
	private StudentMapper dao;
	
	@Override
	public List<Student> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotal(map);
	}

	@Override
	public int add(Student student) {
		// TODO Auto-generated method stub
		return dao.insert(student);
	}

	@Override
	public int update(Student student) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKeySelective(student);
	}

	@Override
	public Student findById(String id) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(id);
	}

}
