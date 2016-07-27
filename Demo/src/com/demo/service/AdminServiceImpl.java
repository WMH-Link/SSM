package com.demo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.AdminMapper;
import com.demo.dao.UserDao;
import com.demo.entity.Admin;
/**
 *  AdminService的实现类
 * @author 汪毅
 *
 */
@Service
public class AdminServiceImpl implements IAdminService{
	@Resource
	AdminMapper adminMapper;
	@Override
	public Admin login(Admin admin) {
		
		Admin loginAdmin=adminMapper.login(admin);
		return loginAdmin;
		/*if(loginAdmin != null)
			return true;
		return false;*/
	}
	@Override
	public int updatePassword(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.updatePassword(admin);
	}

}