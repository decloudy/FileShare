package com.zust.FileShare.dto;

import java.util.Date;

public class FileDto{

	// Fields

	private Integer id;
	private String filetype;
	private String user;
	private String fileName;
	private String fileFormat;
	private Date uploadTime;
	private double size;
	private Integer dwlNum;
	private String fileAddress;
	private String notices;
	private String users;
	private String shares;
	private String departments;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileFormat() {
		return fileFormat;
	}
	public void setFileFormat(String fileFormat) {
		this.fileFormat = fileFormat;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	public Integer getDwlNum() {
		return dwlNum;
	}
	public void setDwlNum(Integer dwlNum) {
		this.dwlNum = dwlNum;
	}
	public String getFileAddress() {
		return fileAddress;
	}
	public void setFileAddress(String fileAddress) {
		this.fileAddress = fileAddress;
	}
	public String getNotices() {
		return notices;
	}
	public void setNotices(String notices) {
		this.notices = notices;
	}	
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}	
	public String getShares() {
		return shares;
	}
	public void setShares(String shares) {
		this.shares = shares;
	}
	public String getDepartments() {
		return departments;
	}
	public void setDepartments(String departments) {
		this.departments = departments;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

}