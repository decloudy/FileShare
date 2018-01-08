package com.zust.FileShare.dao;

import java.util.List;

import com.zust.FileShare.entity.Share;

public interface ShareDao extends BaseDao<Share> {
	public List<Share> findByUser(String sql,int page,int rows);
	
	public Share findById(int id);
}
