package com.zust.FileShare.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zust.FileShare.dao.FileDao;
import com.zust.FileShare.dao.FiletypeDao;
import com.zust.FileShare.dao.ShareDao;
import com.zust.FileShare.dto.ShareDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.Filetype;
import com.zust.FileShare.entity.Share;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.ShareService;

@Service
public class ShareServiceImpl implements ShareService {
		
	@Autowired
	private ShareDao shareDao;
	
	@Autowired
	private FileDao fileDao;
	
	@Autowired
	private FiletypeDao filetypeDao;
	
	
	@Override
	public ShareDto findById(int id) {
		// TODO Auto-generated method stub
		Share share= shareDao.findById(id);
		File file=fileDao.findById(share.getFile().getId());
		Filetype filetype=filetypeDao.findById(file.getFiletype().getId());
		ShareDto shareDto = new ShareDto();
		BeanUtils.copyProperties(share,shareDto);
		shareDto.setUserId(share.getUser().getId());
		shareDto.setFileName(file.getFileName());
		shareDto.setFileTypeName(filetype.getTypeName());
		return shareDto;
	}


	@Override
	public List<ShareDto> findByPages(int page, int rows, String sort,int userId) {
		// TODO Auto-generated method stub
		String sql="select * from share s where s.userId="+userId+" order by shareTime desc";

		List<Share> shareList = shareDao.findByUser(sql, page, rows);
        List<ShareDto> shareDtoList = new ArrayList<ShareDto>();
          
        
        for(Share share:shareList){
    		File file=fileDao.findById(share.getFile().getId());
    		Filetype filetype=filetypeDao.findById(file.getFiletype().getId());
    		ShareDto shareDto = new ShareDto();
    		BeanUtils.copyProperties(share,shareDto);
    		shareDto.setFileId(share.getFile().getId());
    		shareDto.setUserId(share.getUser().getId());
    		shareDto.setFileName(file.getFileName());
    		shareDto.setFileTypeName(filetype.getTypeName());
    		shareDtoList.add(shareDto );
        }
        return shareDtoList;
		

		
	}
	
	
	
	@Override
	public BigInteger getCount(int userId) {
		// TODO Auto-generated method stub
		return shareDao.countBySql("select count(userId) from Share where userId="+userId);
	}
	
	
	@Override
	public int deleteShare(int fileId) {
		// TODO Auto-generated method stub
		String sql="delete from share where fileId="+fileId;
		shareDao.executeSql(sql);
		return 1;
		
	}
	
	
	@Override
	public int deleteByUser(int userId) {
		// TODO Auto-generated method stub
		String sql="delete from share where userId="+userId;
		fileDao.executeSql(sql);
		return 1;
		
	}

}
