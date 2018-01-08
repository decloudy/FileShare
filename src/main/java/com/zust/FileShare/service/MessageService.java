package com.zust.FileShare.service;


import java.util.List;

import com.zust.FileShare.dto.MessageDto;
import com.zust.FileShare.dto.UserDto;

public interface MessageService {
	public int saveMessage(MessageDto msgdto);

	public List<MessageDto> findByType(int type);
}
