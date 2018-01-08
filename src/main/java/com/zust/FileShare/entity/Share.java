package com.zust.FileShare.entity;

import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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

		private Integer id;
		private User user;
		private File file;
		private Date shareTime;

		// Constructors

		/** default constructor */
		public Share() {
		}

		/** full constructor */
		public Share(User user, File file, Date shareTime) {
			this.user = user;
			this.file = file;
			this.shareTime = shareTime;
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
		@JoinColumn(name = "userId")

		public User getUser() {
			return this.user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "fileId")

		public File getFile() {
			return this.file;
		}

		public void setFile(File file) {
			this.file = file;
		}

		@Column(name = "shareTime", length = 19)

		public Date getShareTime() {
			return this.shareTime;
		}

		public void setShareTime(Date shareTime) {
			this.shareTime = shareTime;
		}

}