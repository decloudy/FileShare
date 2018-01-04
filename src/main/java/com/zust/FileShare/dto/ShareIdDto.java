package com.zust.FileShare.dto;

import java.util.Date;
import javax.persistence.Embeddable;

/**
 * ShareId entity. @author MyEclipse Persistence Tools
 */
@Embeddable

public class ShareIdDto{

	// Fields

	private Integer userId;
	private Integer fileId;
	private Date shareTime;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public Date getShareTime() {
		return shareTime;
	}
	public void setShareTime(Date shareTime) {
		this.shareTime = shareTime;
	}

}