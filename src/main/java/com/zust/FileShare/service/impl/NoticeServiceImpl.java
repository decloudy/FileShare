package com.zust.FileShare.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dao.DepartmentDao;
import com.zust.FileShare.dao.MessageDao;
import com.zust.FileShare.dao.NoticeDao;
import com.zust.FileShare.dto.NoticeDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.Department;
import com.zust.FileShare.entity.Notice;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
    private DepartmentDao departmentDao;



	@Override
	public int putNotice(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		Notice notice=new Notice();
		Department department=departmentDao.findById(noticeDto.getDepartId());
		BeanUtils.copyProperties(noticeDto, notice);
		notice.setDepartment(department);
		noticeDao.save(notice);
		return 1;
	}

}
