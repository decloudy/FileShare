
package com.zust.FileShare.service;

import java.util.List;

import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.User;


public interface UserService {
	public User login(String loginName, String password);

	public UserDto findById(int id);
	
	public UserDto findByaccount(String Account);

	public List<UserDto> findAll();
	 
	public int addUser(UserDto userDto);

	public int pwdChange(int id,String password);

	public int infoChange(int id,String tel,String email,int gender,String address);

	public int setChange(int id, int userSet);

	public List<UserDto> findByPages();


}