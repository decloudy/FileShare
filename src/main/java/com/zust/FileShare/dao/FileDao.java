package com.zust.FileShare.dao;

import com.zust.FileShare.entity.File;

/**
 * ��Դ���ݿ������
 * 
 * @author ����
 * 
 */
public interface FileDao extends BaseDao<File> {
	 public File findById(int id);
}
