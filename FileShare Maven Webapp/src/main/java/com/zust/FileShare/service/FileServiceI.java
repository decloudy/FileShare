package com.zust.FileShare.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zust.FileShare.dto.FileDto;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.User;

/**
 * 璧勬簮Service
 * 
 * @author 瀛欏畤
 * 
 */
public interface FileServiceI {

	/**
	 * 鑾峰緱璧勬簮鏍�(璧勬簮绫诲瀷涓鸿彍鍗曠被鍨�)
	 * 
	 * 閫氳繃鐢ㄦ埛ID鍒ゆ柇锛屼粬鑳界湅鍒扮殑璧勬簮
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<FileDto> getFile(int id,int type);

	/**
	 * 鑾峰緱璧勬簮鏍�(鍖呮嫭鎵�鏈夎祫婧愮被鍨�)
	 * 
	 * 閫氳繃鐢ㄦ埛ID鍒ゆ柇锛屼粬鑳界湅鍒扮殑璧勬簮
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<FileDto> allFile(int id);

	/**
	 * 鑾峰緱璧勬簮鍒楄〃
	 * 
	 * @param sessionInfo
	 * 
	 * @return
	 */
	public List<FileDto> fileList();

	/**
	 * 娣诲姞璧勬簮
	 * 
	 * @param resource
	 * @param sessionInfo
	 */
	public void add(FileDto filedto,String type);

	/**
	 * 鍒犻櫎璧勬簮
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 淇敼璧勬簮
	 * 
	 * @param resource
	 */
	public void edit(FileDto filedto);

	/**
	 * 鏌ヨ鏂囦欢
	 * 
	 * @param resource
	 */
	public void select(FileDto filedto);

	/**
	 * 分享
	 * 
	 * @param resource
	 */
	public void share(FileDto filedto,String id);

}
