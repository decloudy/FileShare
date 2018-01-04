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
 * Notice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notice", catalog = "fileshare")

public class Notice implements java.io.Serializable {

	// Fields

	private Integer id;
	private File file;
	private Department department;
	private String title;
	private String noticeContent;
	private Date noticeTime;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** full constructor */
	public Notice(File file, Department department, String title, String noticeContent, Date noticeTime) {
		this.file = file;
		this.department = department;
		this.title = title;
		this.noticeContent = noticeContent;
		this.noticeTime = noticeTime;
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
	@JoinColumn(name = "fileId")

	public File getFile() {
		return this.file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departId")

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Column(name = "title")

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "noticeContent")

	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	@Column(name = "noticeTime", length = 19)

	public Date getNoticeTime() {
		return this.noticeTime;
	}

	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}

}