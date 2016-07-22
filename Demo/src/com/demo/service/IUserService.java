package com.demo.service;

import com.demo.entity.User;

/**
 * 用户service
 * @author hshuai
 *
 */
public interface IUserService {
	/**
	 * 用户登录方法
	 * @param user
	 * @return 
	 * 默认false为登录失败
	 */
	boolean login(User user);
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 * 默认false为注册成功
	 */
	boolean register(User user);
}