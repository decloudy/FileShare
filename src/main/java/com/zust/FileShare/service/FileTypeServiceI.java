package com.zust.FileShare.service;

import java.util.List;

import com.zust.FileShare.dto.FiletypeDto;

/**
 * ��Դ���ͷ���
 * 
 * @author ����
 * 
 */
public interface FileTypeServiceI {

	/**
	 * ��ȡ��Դ����
	 * 
	 * @return
	 */
	public List<FiletypeDto> getFileTypeList();

	public FiletypeDto findById(int id);

}
