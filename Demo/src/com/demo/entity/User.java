package com.demo.entity;


/**
 * 用户对象
 * @author hshuai
 *
 */
public class User{
	
	private Integer id; 
	/**
	 * 用户邮箱
	 */
	private String email;
	/**
	 * 用户密码
	 */
	private String password;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

}
