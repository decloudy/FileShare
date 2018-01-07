package com.zust.FileShare.service.impl;

import java.util.ArrayList;
import java.util.Date;
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
	public List<UserDto> findByPages(int page,int rows,String sort) {
		// TODO Auto-generated method stub
		String hql="from User u ";
		if(sort!=null&&sort!=""){
			hql=hql+" ORDER BY "+sort;
		}
		List<User> userList = userDao.find(hql, page, rows);
        List<UserDto> userDtoList = new ArrayList<UserDto>();
        for(User user:userList){
        	UserDto userdto = new UserDto();
            BeanUtils.copyProperties(user,userdto);
            userdto.setDepartName(user.getDepartment().getDepartName());
			userdto.setDepartId(user.getDepartment().getId());
			if(user.getUserGender()==1){
				userdto.setGender("男");
			}else if(user.getUserGender()==-1){
				userdto.setGender("女");
			}else{
				userdto.setGender("保密");
			}
			if(user.getAddress()==null||user.getAddress().trim()==""){
				userdto.setAddress("未填写");
			}
			if(user.getEmail()==null||user.getEmail().trim()==""){
				userdto.setEmail("未填写");
			}
			if(user.getTelephone()==null||user.getTelephone().trim()==""){
				userdto.setTelephone("未填写");
			}
            userDtoList.add(userdto);
        }
        return userDtoList;
	}
	
	
	@Override
	public List<UserDto> findAllUsers() {
		// TODO Auto-generated method stub
		 List<User> userList = userDao.findAll();
	        List<UserDto> userDtoList = new ArrayList<UserDto>();
	        for(User user:userList){
	        	UserDto userdto = new UserDto();
	            BeanUtils.copyProperties(user,userdto);
	            userdto.setDepartName(user.getDepartment().getDepartName());
				userdto.setDepartId(user.getDepartment().getId());
				if(user.getUserGender()==1){
					userdto.setGender("男");
				}else if(user.getUserGender()==-1){
					userdto.setGender("女");
				}else{
					userdto.setGender("保密");
				}
				if(user.getAddress()==null||user.getAddress().trim()==""){
					userdto.setAddress("未填写");
				}
				if(user.getEmail()==null||user.getEmail().trim()==""){
					userdto.setEmail("未填写");
				}
				if(user.getTelephone()==null||user.getTelephone().trim()==""){
					userdto.setTelephone("未填写");
				}
	            userDtoList.add(userdto);
	        }
	        return userDtoList;
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

	@Override
	public long getCount() {
		// TODO Auto-generated method stub
		return userDao.count("select count(id) from User");
	}

	@Override
	public int userChange(int id, String userName, String userAccount, int departId, String workTime) {
		// TODO Auto-generated method stub
		String sql="update user u set userName='"+userName+"',userAccount="+userAccount+",departId="+departId+",workTime='"+workTime+"' where u.Id="+id;
		userDao.executeSql(sql);
		return 1;
		
	}
	
	
	@Override
	public long getSearchCount(String searchMethod,String searchContent) {
		// TODO Auto-generated method stub
		return userDao.count("select count(id) from User where "+searchMethod+" like'%"+searchContent+"%'");
	}
	
	
	
	@Override
	public int resetPwd(int id, String password) {
		// TODO Auto-generated method stub
		String sql="update user u set password='"+password+"' where u.Id="+id;
		userDao.executeSql(sql);
		return 1;
		
	}

	@Override
	public List<UserDto> searchByPages(int page, int rows, String sort, String searchMethod, String searchContent) {
		// TODO Auto-generated method stub
		String hql="from User where "+searchMethod+" like'%"+searchContent+"%'";
		List<User> userList = userDao.find(hql, page, rows);
        List<UserDto> userDtoList = new ArrayList<UserDto>();
        for(User user:userList){
        	UserDto userdto = new UserDto();
            BeanUtils.copyProperties(user,userdto);
            userdto.setDepartName(user.getDepartment().getDepartName());
			userdto.setDepartId(user.getDepartment().getId());
			if(user.getUserGender()==1){
				userdto.setGender("男");
			}else if(user.getUserGender()==-1){
				userdto.setGender("女");
			}else{
				userdto.setGender("保密");
			}
			if(user.getAddress()==null||user.getAddress().trim()==""){
				userdto.setAddress("未填写");
			}
			if(user.getEmail()==null||user.getEmail().trim()==""){
				userdto.setEmail("未填写");
			}
			if(user.getTelephone()==null||user.getTelephone().trim()==""){
				userdto.setTelephone("未填写");
			}
            userDtoList.add(userdto);
        }
        return userDtoList;
		
	}

}
