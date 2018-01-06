package com.zust.FileShare.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * File entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "file", catalog = "fileshare")

public class File implements java.io.Serializable {

	// Fields

	private Integer id;
	private Filetype filetype;
	private User user;
	private String fileName;
	private String fileAddress;
	private String fileFormat;
	private Date uploadTime;
	private double size;
	private Integer dwlNum;
	private Set<Notice> notices = new HashSet<Notice>(0);
	private Set<User> users = new HashSet<User>(0);
	private Set<Share> shares = new HashSet<Share>(0);
	private Set<Department> departments = new HashSet<Department>(0);

	// Constructors

	/** default constructor */
	public File() {
	}

	/** full constructor */
	public File(Filetype filetype, User user, String fileName,String fileAddress, String fileFormat, Date uploadTime, double size,
			Integer dwlNum, Set<Notice> notices, Set<User> users, Set<Share> shares, Set<Department> departments) {
		this.filetype = filetype;
		this.user = user;
		this.fileName = fileName;
		this.fileAddress = fileAddress;
		this.fileFormat = fileFormat;
		this.uploadTime = uploadTime;
		this.size = size;
		this.dwlNum = dwlNum;
		this.notices = notices;
		this.users = users;
		this.shares = shares;
		this.departments = departments;
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
	@JoinColumn(name = "fileType")

	public Filetype getFiletype() {
		return this.filetype;
	}

	public void setFiletype(Filetype filetype) {
		this.filetype = filetype;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uploaderId")

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "fileName")

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	@Column(name = "fileAddress")

	public String getFileAddress() {
		return this.fileAddress;
	}

	public void setFileAddress(String fileAddress) {
		this.fileAddress = fileAddress;
	}

	@Column(name = "fileFormat")

	public String getFileFormat() {
		return this.fileFormat;
	}

	public void setFileFormat(String fileFormat) {
		this.fileFormat = fileFormat;
	}

	@Column(name = "uploadTime", length = 19)

	public Date getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Column(name = "size", precision = 22, scale = 0)

	public double getSize() {
		return this.size;
	}

	public void setSize(double size) {
		this.size = size;
	}

	@Column(name = "dwlNum")

	public Integer getDwlNum() {
		return this.dwlNum;
	}

	public void setDwlNum(Integer dwlNum) {
		this.dwlNum = dwlNum;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "file")

	public Set<Notice> getNotices() {
		return this.notices;
	}

	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "files_1")

	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "file")

	public Set<Share> getShares() {
		return this.shares;
	}

	public void setShares(Set<Share> shares) {
		this.shares = shares;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "departfile", catalog = "fileshare", joinColumns = {
			@JoinColumn(name = "fileId", updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "departId", updatable = false) })

	public Set<Department> getDepartments() {
		return this.departments;
	}

	public void setDepartments(Set<Department> departments) {
		this.departments = departments;
	}

}