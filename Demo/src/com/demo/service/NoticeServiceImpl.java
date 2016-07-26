package com.demo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.demo.dao.NoticeMapper;
import com.demo.entity.Notice;

/**
 * 公告管理Service实现类
 * @author 廖明兴
 *
 */
@Service("noticeService")
public class NoticeServiceImpl implements INoticeService{
	@Resource
	private NoticeMapper noticeMapper;
	
	@Override
	public List<Notice> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeMapper.getTotal(map);
	}

	@Override
	public int add(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.add(notice);
	}

	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.update(notice);
	}

	@Override
	public Notice findById(Integer id) {
		// TODO Auto-generated method stub
		return noticeMapper.findById(id);
	}	
}