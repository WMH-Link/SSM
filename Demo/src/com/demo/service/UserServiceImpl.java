package com.demo.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.UserDao;
import com.demo.entity.User;

/**
 *  UserService的实现类
 * @author hshuai
 *
 */
@Service
public class UserServiceImpl implements IUserService{
	//Resource注解
	@Resource
	UserDao userDao;
	
	@Override
	public boolean login(User user) {
		User loginUser=userDao.login(user);
		if(loginUser != null)
			return true;
		return false;
	}
	
	@Override
	public boolean register(User user) {
		userDao.register(user);
		return true;
	}

}