package com.zust.FileShare.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zust.FileShare.dao.FileDao;
import com.zust.FileShare.dao.FiletypeDao;
import com.zust.FileShare.dto.FileDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.Filetype;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.FileServiceI;

@Service
@Transactional
public class FileServiceImpl implements FileServiceI {
	@Autowired
	private FileDao fileDao;

	Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);

	 @Autowired
	 private FiletypeDao fileTypeDao;
	//
	// @Autowired
	// private UserDaoI userDao;
	// 根据用户id和点击类型以显示
	@Override
	public List<FileDto> getFile(int id, int type) {
		Map<String, Object> params = new HashMap<String, Object>();
		// int type1=Integer.parseInt(type);
		params.put("fileTypeId", type);
		params.put("userId", 1);// 閼奉亝鐓￠懛顏勭箒閺堝娼堥梽鎰畱鐠у嫭绨�
		// SELECT DISTINCT file.* FROM file,user,filetype WHERE file.uploaderId = 1 AND
		

		List<File> file1 = fileDao
				.find("select distinct f " + "from File f join fetch f.user u join fetch f.filetype ft "
						+ "where u.id = :userId and ft.id = :fileTypeId", params);
		List<FileDto> fds = new ArrayList<FileDto>();
		if (file1 != null) {
			for (File f : file1) {
				// for(File f:fileList){
				// for(int i=0;i<fileList.size();i++){
				// File f = (File)file.get(i);
				// }
				FileDto fd = new FileDto();
				BeanUtils.copyProperties(f, fd);
				fds.add(fd);
			}
		}
		return fds;
	}

	@Override
	public List<FileDto> allFile(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		List<File> file1 = null;
		params.put("userId", id);// 閼奉亝鐓￠懛顏勭箒閺堝娼堥梽鎰畱鐠у嫭绨�
		// SELECT DISTINCT file.* FROM file,user,filetype WHERE file.uploaderId = 1 AND
		// file.fileType = 1

		file1 = fileDao.find("select distinct f " + "from File f join fetch f.user u join fetch f.filetype ft "
				+ "where u.id = :userId", params);
		List<FileDto> fds = new ArrayList<FileDto>();
		if (file1 != null) {
			for (File f : file1) {
				// for(File f:fileList){
				// for(int i=0;i<fileList.size();i++){
				// File f = (File)file.get(i);
				// }
				FileDto fd = new FileDto();
				BeanUtils.copyProperties(f, fd);
				fds.add(fd);
			}
		}
		return fds;
	}

	@Override
	public List<FileDto> fileList() {
		// TODO Auto-generated method stub
		//
		// List<File> file1=fileDao.find("from File f where f.id=1");
		// logger.info("进入:"+file1.size());
		return null;
	}

	@Override
	public void add(FileDto filedto,String type) {
		 String suffixList1 = ".txt,.doc,.rtf,.docx,.odt,.docm,.dotx,.dotm,.dot,.pdf,.xps,.mht,.mhtml,.xml,.wtf";
		 String suffixList2 = ".jpg,.gif,.png,.ico,.bmp,.jpeg";
		 String suffixList3 = ".wma,.wav,.mp3";
		 String suffixList4 = ".rm,.rmvb,.wmv,.mpg";
		 String truetype;
		
		 if(suffixList1.contains(type.trim().toLowerCase())){
			 truetype="1";
		 }
		 else if (suffixList2.contains(type.trim().toLowerCase())) {
			 truetype="2";
	        }
		else if(suffixList3.contains(type.trim().toLowerCase())) {
			truetype="3";
		}
		else if(suffixList4.contains(type.trim().toLowerCase())) {
			truetype="4";
		}
		else{
			truetype="5";
		}
		filedto.setFiletype(truetype);
		File f = new File();
		BeanUtils.copyProperties(filedto, f);
//		if (filedto.getId() != null && !filedto.getId().equals("")) {
//			f.setFile(fileDao.get(File.class, filedto.getId()));
//		}
//		if (filedto.getFiletype() != null && !filedto.getFiletype().equalsIgnoreCase("")) {
//			f.setFiletype(fileTypeDao.get(Filetype.class, filedto.getFiletype()));
//		}
		
		fileDao.save(f);

	}
	
	@Override
	public FileDto findById(int id) {
		// TODO Auto-generated method stub
		File file= fileDao.findById(id);
		FileDto fileDto = new FileDto();
		BeanUtils.copyProperties(file,fileDto);
		return fileDto;
	}
	
	

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void edit(FileDto filedto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void select(FileDto filedto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void share(FileDto filedto,String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteFile(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
