package com.zust.FileShare.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * ShareId entity. @author MyEclipse Persistence Tools
 */
@Embeddable

public class ShareId implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Integer fileId;
	private Date shareTime;

	// Constructors

	/** default constructor */
	public ShareId() {
	}

	/** full constructor */
	public ShareId(Integer userId, Integer fileId, Date shareTime) {
		this.userId = userId;
		this.fileId = fileId;
		this.shareTime = shareTime;
	}

	// Property accessors

	@Column(name = "userId")

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "fileId")

	public Integer getFileId() {
		return this.fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	@Column(name = "shareTime", length = 19)

	public Date getShareTime() {
		return this.shareTime;
	}

	public void setShareTime(Date shareTime) {
		this.shareTime = shareTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ShareId))
			return false;
		ShareId castOther = (ShareId) other;

		return ((this.getUserId() == castOther.getUserId()) || (this.getUserId() != null
				&& castOther.getUserId() != null && this.getUserId().equals(castOther.getUserId())))
				&& ((this.getFileId() == castOther.getFileId()) || (this.getFileId() != null
						&& castOther.getFileId() != null && this.getFileId().equals(castOther.getFileId())))
				&& ((this.getShareTime() == castOther.getShareTime()) || (this.getShareTime() != null
						&& castOther.getShareTime() != null && this.getShareTime().equals(castOther.getShareTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37 * result + (getFileId() == null ? 0 : this.getFileId().hashCode());
		result = 37 * result + (getShareTime() == null ? 0 : this.getShareTime().hashCode());
		return result;
	}

}