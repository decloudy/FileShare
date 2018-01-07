package com.zust.FileShare.dto;

import java.util.Date;


public class MessageDto {
	private Integer id;
	private Integer userByReceiveId;
	private Integer userBySendId;
	private String content;
	private Date msgTime;
	private Integer msgType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserByReceiveId() {
		return userByReceiveId;
	}
	public void setUserByReceiveId(Integer userByReceiveId) {
		this.userByReceiveId = userByReceiveId;
	}
	public Integer getUserBySendId() {
		return userBySendId;
	}
	public void setUserBySendId(Integer userBySendId) {
		this.userBySendId = userBySendId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}
	public Integer getMsgType() {
		return msgType;
	}
	public void setMsgType(Integer msgType) {
		this.msgType = msgType;
	}
}
