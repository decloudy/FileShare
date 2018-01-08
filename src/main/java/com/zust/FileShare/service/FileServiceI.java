package com.zust.FileShare.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zust.FileShare.dto.FileDto;
import com.zust.FileShare.entity.File;
import com.zust.FileShare.entity.User;

/**
 * 鐠у嫭绨甋ervice
 * 
 * @author 鐎涙瑥鐣�
 * 
 */
public interface FileServiceI {

	/**
	 * 閼惧嘲绶辩挧鍕爱閺嶏拷(鐠у嫭绨猾璇茬�锋稉楦垮綅閸楁洜琚崹锟�)
	 * 
	 * 闁俺绻冮悽銊﹀煕ID閸掋倖鏌囬敍灞肩铂閼崇晫婀呴崚鎵畱鐠у嫭绨�
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<FileDto> getFile(int id,int type);

	/**
	 * 閼惧嘲绶辩挧鍕爱閺嶏拷(閸栧懏瀚幍锟介張澶庣カ濠ф劗琚崹锟�)
	 * 
	 * 闁俺绻冮悽銊﹀煕ID閸掋倖鏌囬敍灞肩铂閼崇晫婀呴崚鎵畱鐠у嫭绨�
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<FileDto> allFile(int id);

	/**
	 * 閼惧嘲绶辩挧鍕爱閸掓銆�
	 * 
	 * @param sessionInfo
	 * 
	 * @return
	 */
	public List<FileDto> fileList();

	/**
	 * 濞ｈ濮炵挧鍕爱
	 * 
	 * @param resource
	 * @param sessionInfo
	 */
	public void add(FileDto filedto,String type);

	/**
	 * 閸掔娀娅庣挧鍕爱
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 娣囶喗鏁肩挧鍕爱
	 * 
	 * @param resource
	 */
	public void edit(FileDto filedto);

	/**
	 * 閺屻儴顕楅弬鍥︽
	 * 
	 * @param resource
	 */
	public void select(FileDto filedto);

	/**
	 * 鍒嗕韩
	 * 
	 * @param resource
	 */
	public void share(FileDto filedto,String id);
	
	
	public int deleteFile(int id);

	public FileDto findById(int id);

	public int deleteByUser(int userId);

}
