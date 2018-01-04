
package com.zust.FileShare.dto;

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


public class UserDto  {

	// Fields

	private Integer id;
	private String password;
	private Integer departId;
	private String departName;
	private String userAccount;
	private String userName;
	private Integer userGender;
	private String  gender;
	private Date workTime;
	private String email;
	private String telephone;
	private Integer userType;
	private Integer userSet;
	private String address;
	private Integer newMessage;


	// Constructors

	/** default constructor */
	public UserDto() {
	}

	/** minimal constructor */
	public UserDto(Integer userType) {
		this.userType = userType;
	}


	public Integer getDepartId() {
		return this.departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}
	
	
	public String getDepartName() {
		return this.departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}



	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getUserAccount() {
		return this.userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}



	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Integer getUserGender() {
		return this.userGender;
	}

	public void setUserGender(Integer userGender) {
		this.userGender = userGender;
	}
	
	
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	public Date getWorkTime() {
		return this.workTime;
	}

	public void setWorkTime(Date workTime) {
		this.workTime = workTime;
	}



	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}


	public Integer getUserSet() {
		return this.userSet;
	}

	public void setUserSet(Integer userSet) {
		this.userSet = userSet;
	}



	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public Integer getNewMessage() {
		return this.newMessage;
	}

	public void setNewMessage(Integer newMessage) {
		this.newMessage = newMessage;
	}

	

}