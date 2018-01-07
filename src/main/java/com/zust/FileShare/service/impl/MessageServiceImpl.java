package com.zust.FileShare.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dao.MessageDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.dto.MessageDto;
import com.zust.FileShare.entity.Message;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
    private UserDao userDao;
	
	@Autowired
	private MessageDao messagedao;
	
	@Override
	public int saveMessage(MessageDto msgdto) {
		Message msg=new Message();
		BeanUtils.copyProperties(msgdto, msg);
		User reu=userDao.findById(msgdto.getUserByReceiveId());
		User sendu=userDao.findById(msgdto.getUserBySendId());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date time=null;
		try {
		   time= sdf.parse(sdf.format(new Date()));

		} catch (ParseException e) {

		   e.printStackTrace();
		}
		msg.setMsgTime(time);
		msg.setUserBySendId(sendu);
		msg.setUserByReceiveId(reu);
		messagedao.save(msg);
		return 1;
	}
}
