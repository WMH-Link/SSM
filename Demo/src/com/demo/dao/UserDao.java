package com.demo.dao;

import com.demo.entity.User;


public interface UserDao {
	/**
	 * 用户登录dao接口
	 * @param user
	 * @return
	 */
	User login(User user);
	
	/**
	 * 用户注册dao接口
	 * @param user
	 * @return
	 */
	void register(User user);
}

