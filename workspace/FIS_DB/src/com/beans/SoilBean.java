package com.beans;

import java.util.List;

public class SoilBean {
	private String name;
	private int sid;
	private List<SoilBean> allSoils;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public List<SoilBean> getAllSoils() {
		return allSoils;
	}
	public void setAllSoils(List<SoilBean> allSoils) {
		this.allSoils = allSoils;
	}
	
	
}
