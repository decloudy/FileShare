package com.zust.FileShare.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Share entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "share", catalog = "fileshare")

public class Share implements java.io.Serializable {

	// Fields

	private ShareId id;
	private User user;
	private File file;

	// Constructors

	/** default constructor */
	public Share() {
	}

	/** minimal constructor */
	public Share(ShareId id) {
		this.id = id;
	}

	/** full constructor */
	public Share(ShareId id, User user, File file) {
		this.id = id;
		this.user = user;
		this.file = file;
	}

	// Property accessors
	@EmbeddedId

	@AttributeOverrides({ @AttributeOverride(name = "userId", column = @Column(name = "userId")),
			@AttributeOverride(name = "fileId", column = @Column(name = "fileId")),
			@AttributeOverride(name = "shareTime", column = @Column(name = "shareTime", length = 19)) })

	public ShareId getId() {
		return this.id;
	}

	public void setId(ShareId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", insertable = false, updatable = false)

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fileId", insertable = false, updatable = false)

	public File getFile() {
		return this.file;
	}

	public void setFile(File file) {
		this.file = file;
	}

}