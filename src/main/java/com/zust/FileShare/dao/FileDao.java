package com.zust.FileShare.dao;

import com.zust.FileShare.entity.File;

/**
 * 资源数据库操作类
 * 
 * @author 孙宇
 * 
 */
public interface FileDao extends BaseDao<File> {
	 public File findById(int id);
}
