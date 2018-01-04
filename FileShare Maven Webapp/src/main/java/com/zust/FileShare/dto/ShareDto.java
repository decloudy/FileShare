package com.zust.FileShare.dto;
public class ShareDto{

	private ShareIdDto id;
	private String user;
	private String file;
	
	public ShareIdDto getId() {
		return id;
	}
	public void setId(ShareIdDto id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}

}