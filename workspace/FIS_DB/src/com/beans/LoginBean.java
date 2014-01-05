package com.beans;

public class LoginBean {
	
	private String uid,pwd,userRole="none";
	private int fid;
	
	
	public void setUid(String uid)
	{
		this.uid = uid.trim();
	}

	public String getUid()
	{
		 return uid;
	}
	
	public void setPwd(String s)
	{
		pwd = s;
	}

	public String getPwd()
	{
		 return pwd;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}
