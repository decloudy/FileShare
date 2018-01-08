package com.zust.FileShare.service;


import java.math.BigInteger;
import java.util.List;

import com.zust.FileShare.dto.MessageDto;
import com.zust.FileShare.dto.UserDto;

public interface MessageService {
	public int saveMessage(MessageDto msgdto);

	public List<MessageDto> findByType(int type);
	
	public List<MessageDto> findByPage(int page, int rows,int receiveId);

	public BigInteger getCount(int receiveId);

	public int deleteMsg(int msgId);

	public int deleteBysendUser(int userId);

	public int deleteByreceiveUser(int userId);
}
