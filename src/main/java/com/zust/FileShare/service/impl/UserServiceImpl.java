package com.zust.FileShare.service.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.Department;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.UserService;
import com.zust.FileShare.dao.DepartmentDao;
import com.zust.FileShare.dao.UserDao;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
    private UserDao userDao;
	
	@Autowired
    private DepartmentDao departmentDao;
	
	@Override
	public User login(String loginName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDto findById(int id) {
		// TODO Auto-generated method stub
		User user= userDao.findById(id);
		UserDto userDto = new UserDto();
		BeanUtils.copyProperties(user,userDto);
		userDto.setDepartName(user.getDepartment().getDepartName());
		userDto.setDepartId(user.getDepartment().getId());
		if(user.getUserGender()==1){
			userDto.setGender("男");
		}else if(user.getUserGender()==-1){
			userDto.setGender("女");
		}else{
			userDto.setGender("保密");
		}
		if(user.getAddress()==null||user.getAddress().trim()==""){
			userDto.setAddress("未填写");
		}
		if(user.getEmail()==null||user.getEmail().trim()==""){
			userDto.setEmail("未填写");
		}
		if(user.getTelephone()==null||user.getTelephone().trim()==""){
			userDto.setTelephone("未填写");
		}
		

		
		return userDto;
	}
	
	@Override
	public int pwdChange(int id,String password) {
		// TODO Auto-generated method stub
		String sql="update user u set password='"+password+"' where u.Id="+id;
		userDao.executeSql(sql);
		return 1;
	}
	
	
	
	@Override
	public int setChange(int id,int userSet) {
		// TODO Auto-generated method stub
		String sql="update user u set userSet="+userSet+" where u.Id="+id;
		userDao.executeSql(sql);
		return 1;
	}
	
	
	@Override
	public int infoChange(int id,String tel,String email,int gender,String address) {
		// TODO Auto-generated method stub
		String tel1=null;
		String email1=null;
		String address1=null;	
		
		if(tel!=""){
			tel1="'"+tel+"'";
		}
		
		if(email!=""){
			email1="'"+email+"'";
		}
		
		if(address!=""){
			address1="'"+address+"'";
		}
		
		String sql="update user u set telephone="+tel1+",email="+email1+",userGender="+gender+",address="+address1+" where u.Id="+id;
		userDao.executeSql(sql);
		return 1;
	}
	
	
	public UserDto findByaccount(String Account) {
		User user = userDao.findByAccount(Account);
		UserDto userDto = new UserDto();
		if (user == null)
			return null;
		else {
			BeanUtils.copyProperties(user, userDto);
			userDto.setDepartName(user.getDepartment().getDepartName());
			userDto.setDepartId(user.getDepartment().getId());
			if(user.getUserGender()==1){
				userDto.setGender("男");
			}else if(user.getUserGender()==-1){
				userDto.setGender("女");
			}else{
				userDto.setGender("保密");
			}
			if(user.getAddress()==null||user.getAddress().trim()==""){
				userDto.setAddress("未填写");
			}
			if(user.getEmail()==null||user.getEmail().trim()==""){
				userDto.setEmail("未填写");
			}
			if(user.getTelephone()==null||user.getTelephone().trim()==""){
				userDto.setTelephone("未填写");
			}
			return userDto;
		}
	}
	
	

	@Override
	public List<UserDto> findByPages() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@Override
	public List<UserDto> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addUser(UserDto userDto) {
		// TODO Auto-generated method stub	
		User user=new User();
		Department department=departmentDao.findById(userDto.getDepartId());
		BeanUtils.copyProperties(userDto, user);
		user.setDepartment(department);
		userDao.save(user);
		return 1;
	}

}
