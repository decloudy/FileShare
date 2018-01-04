package com.zust.FileShare.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Department entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "department", catalog = "fileshare")

public class Department implements java.io.Serializable {

	// Fields

	private Integer id;
	private String departName;
	private Set<File> files = new HashSet<File>(0);
	private Set<Notice> notices = new HashSet<Notice>(0);
	private Set<User> users = new HashSet<User>(0);

	// Constructors

	/** default constructor */
	public Department() {
	}

	/** full constructor */
	public Department(String departName, Set<File> files, Set<Notice> notices, Set<User> users) {
		this.departName = departName;
		this.files = files;
		this.notices = notices;
		this.users = users;
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

	@Column(name = "departName")

	public String getDepartName() {
		return this.departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "departments")

	public Set<File> getFiles() {
		return this.files;
	}

	public void setFiles(Set<File> files) {
		this.files = files;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "department")

	public Set<Notice> getNotices() {
		return this.notices;
	}

	public void setNotices(Set<Notice> notices) {
		this.notices = notices;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "department")

	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}