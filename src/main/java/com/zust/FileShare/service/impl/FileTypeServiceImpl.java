package com.zust.FileShare.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zust.FileShare.dao.FiletypeDao;
import com.zust.FileShare.dto.FiletypeDto;
import com.zust.FileShare.entity.Filetype;
import com.zust.FileShare.service.FileTypeServiceI;

@Service
@Transactional
public class FileTypeServiceImpl implements FileTypeServiceI {

	@Autowired
	private FiletypeDao fileType;

	@Override
	public List<FiletypeDto> getFileTypeList() {
		List<Filetype> l = fileType.find("from Filetype t");
		List<FiletypeDto> rl = new ArrayList<FiletypeDto>();
		if (l != null && l.size() > 0) {
			for (Filetype t : l) {
				FiletypeDto rt = new FiletypeDto();
				BeanUtils.copyProperties(t, rt);
				rl.add(rt);
			}
		}
		return rl;
	}	
}
