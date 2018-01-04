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
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "fileshare")

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private Department department;
	private String password;
	private String userAccount;
	private String userName;
	private Integer userGender;
	private Date workTime;
	private String email;
	private String telephone;
	private Integer userType;
	private Integer userSet;
	private String address;
	private Integer newMessage;
	private Set<File> files = new HashSet<File>(0);
	private Set<File> files_1 = new HashSet<File>(0);
	private Set<Message> messagesForReceiveId = new HashSet<Message>(0);
	private Set<Message> messagesForSendId = new HashSet<Message>(0);
	private Set<Share> shares = new HashSet<Share>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(Integer userType) {
		this.userType = userType;
	}

	/** full constructor */
	public User(Department department, String password, String userAccount, String userName, Integer userGender,
			Date workTime, String email, String telephone, Integer userType, Integer userSet, String address,
			Integer newMessage, Set<File> files, Set<File> files_1, Set<Message> messagesForReceiveId,
			Set<Message> messagesForSendId, Set<Share> shares) {
		this.department = department;
		this.password = password;
		this.userAccount = userAccount;
		this.userName = userName;
		this.userGender = userGender;
		this.workTime = workTime;
		this.email = email;
		this.telephone = telephone;
		this.userType = userType;
		this.userSet = userSet;
		this.address = address;
		this.newMessage = newMessage;
		this.files = files;
		this.files_1 = files_1;
		this.messagesForReceiveId = messagesForReceiveId;
		this.messagesForSendId = messagesForSendId;
		this.shares = shares;
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
	@JoinColumn(name = "dapartId")

	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Column(name = "password")

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "userAccount")

	public String getUserAccount() {
		return this.userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	@Column(name = "userName")

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "userGender")

	public Integer getUserGender() {
		return this.userGender;
	}

	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
	}

	@Column(name = "workTime", length = 19)

	public Date getWorkTime() {
		return this.workTime;
	}

	public void setWorkTime(Date workTime) {
		this.workTime = workTime;
	}

	@Column(name = "email")

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "telephone")

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "userType", nullable = false)

	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	@Column(name = "userSet")

	public Integer getUserSet() {
		return this.userSet;
	}

	public void setUserSet(Integer userSet) {
		this.userSet = userSet;
	}

	@Column(name = "address")

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "newMessage")

	public Integer getNewMessage() {
		return this.newMessage;
	}

	public void setNewMessage(Integer newMessage) {
		this.newMessage = newMessage;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")

	public Set<File> getFiles() {
		return this.files;
	}

	public void setFiles(Set<File> files) {
		this.files = files;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "userfile", catalog = "fileshare", joinColumns = {
			@JoinColumn(name = "userId", updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "fileId", updatable = false) })

	public Set<File> getFiles_1() {
		return this.files_1;
	}

	public void setFiles_1(Set<File> files_1) {
		this.files_1 = files_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userByReceiveId")

	public Set<Message> getMessagesForReceiveId() {
		return this.messagesForReceiveId;
	}

	public void setMessagesForReceiveId(Set<Message> messagesForReceiveId) {
		this.messagesForReceiveId = messagesForReceiveId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "userBySendId")

	public Set<Message> getMessagesForSendId() {
		return this.messagesForSendId;
	}

	public void setMessagesForSendId(Set<Message> messagesForSendId) {
		this.messagesForSendId = messagesForSendId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")

	public Set<Share> getShares() {
		return this.shares;
	}

	public void setShares(Set<Share> shares) {
		this.shares = shares;
	}

}