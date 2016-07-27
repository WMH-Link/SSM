package com.demo.service;

import com.demo.entity.Admin;

/**
 * @author 汪毅
 *
 */
public interface IAdminService {
	/**
	 * 管理员登录方法
	 * @param admin
	 * @return 
	 * 默认false为登录失败
	 */
	Admin login(Admin admin);
	
	/**
	 * 管理员修改密码
	 * @param admin
	 * @return 
	 * 默认1为登录失败
	 */
	int updatePassword(Admin admin);


}
