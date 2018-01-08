package com.zust.FileShare.service;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.zust.FileShare.dao.FileDao;
import com.zust.FileShare.dto.ShareDto;
import com.zust.FileShare.dto.ShareDto;
import com.zust.FileShare.dto.UserDto;

public  interface  ShareService {

	public ShareDto findById(int id);
	public List<ShareDto> findByPages(int page,int rows,String sort,int userId);
	
	public BigInteger getCount(int userId); 
	
}
