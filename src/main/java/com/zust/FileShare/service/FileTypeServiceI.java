package com.zust.FileShare.service;

import java.util.List;

import com.zust.FileShare.dto.FiletypeDto;

/**
 * 资源类型服务
 * 
 * @author 孙宇
 * 
 */
public interface FileTypeServiceI {

	/**
	 * 获取资源类型
	 * 
	 * @return
	 */
	public List<FiletypeDto> getFileTypeList();

	public FiletypeDto findById(int id);

}
