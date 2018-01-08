package com.zust.FileShare.service.impl;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dao.MessageDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.dto.MessageDto;
import com.zust.FileShare.dto.ShareDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.Filetype;
import com.zust.FileShare.entity.Message;
import com.zust.FileShare.entity.Share;
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
	
	
	@Override
	public List<MessageDto> findByType(int type) {
		// TODO Auto-generated method stub
		String hql="from Message m where m.msgType="+type;
		List<Message> messageList = messagedao.find(hql);
        List<MessageDto> messageDtoList = new ArrayList<MessageDto>();
        for(Message message:messageList){
        	MessageDto messageDto = new MessageDto();
            BeanUtils.copyProperties(message,messageDto);
            messageDto.setUserByReceiveId(message.getUserByReceiveId().getId());
            messageDto.setUserBySendId(message.getUserBySendId().getId());
            messageDtoList.add(messageDto);
        }
        return messageDtoList;
		
	}


	@Override
	public List<MessageDto> findByPage(int page, int rows,int receiveId) {
		// TODO Auto-generated method stub
		String sql="select * from message m where m.receiveId="+receiveId+" order by msgTime desc";

		List<Message> messageList = messagedao.findByUser(sql, page, rows);
        List<MessageDto> messageDtoList = new ArrayList<MessageDto>();
          
        
        for(Message msg:messageList){
    		MessageDto msgDto = new MessageDto();
    		User user=userDao.findById(msg.getUserBySendId().getId());
    		BeanUtils.copyProperties(msg,msgDto);
    		msgDto.setSendName(user.getUserName());
    		messageDtoList.add(msgDto );
        }
        return messageDtoList;
	}
	
	
	@Override
	public BigInteger getCount(int receiveId) {
		// TODO Auto-generated method stub
		return messagedao.countBySql("select count(Id) from Message where receiveId="+receiveId);
	}
	
	
	@Override
	public int deleteMsg(int msgId) {
		// TODO Auto-generated method stub
		String sql="delete from message where Id="+msgId;
		messagedao.executeSql(sql);
		return 1;
		
	}
	
}
