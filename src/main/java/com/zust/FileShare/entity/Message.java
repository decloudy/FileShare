package com.zust.FileShare.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "message", catalog = "fileshare")

public class Message implements java.io.Serializable {

	// Fields

	private Integer id;
	private User userByReceiveId;
	private User userBySendId;
	private String content;
	private Date msgTime;
	private Integer msgType;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(User userByReceiveId, User userBySendId, String content, Date msgTime, Integer msgType) {
		this.userByReceiveId = userByReceiveId;
		this.userBySendId = userBySendId;
		this.content = content;
		this.msgTime = msgTime;
		this.msgType = msgType;
	}

	// Property accessors
	@Id
	@GeneratedValue

	@Column(name = "Id", unique = true, nullable = false)

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiveId")

	public User getUserByReceiveId() {
		return this.userByReceiveId;
	}

	public void setUserByReceiveId(User userByReceiveId) {
		this.userByReceiveId = userByReceiveId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sendId")

	public User getUserBySendId() {
		return this.userBySendId;
	}

	public void setUserBySendId(User userBySendId) {
		this.userBySendId = userBySendId;
	}

	@Column(name = "content")

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "msgTime", length = 19)

	public Date getMsgTime() {
		return this.msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	@Column(name = "msgType")

	public Integer getMsgType() {
		return this.msgType;
	}

	public void setMsgType(Integer msgType) {
		this.msgType = msgType;
	}

}