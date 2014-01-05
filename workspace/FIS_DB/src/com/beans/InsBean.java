package com.beans;

import java.util.List;

public class InsBean {
	private String name;
	private Float interest,premium;
	private String type;
	private Integer term,insID;
	private Integer count;
	private List<InsBean> allInss;
	private List<String> allTypes;
	private List<Integer> myInss;
	private List<Integer> otherInss;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getInterest() {
		return interest;
	}
	public void setInterest(Float interest) {
		this.interest = interest;
	}
	public Float getPremium() {
		return premium;
	}
	public void setPremium(Float premium) {
		this.premium = premium;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	public Integer getInsID() {
		return insID;
	}
	public void setInsID(Integer insID) {
		this.insID = insID;
	}
	public List<InsBean> getAllInss() {
		return allInss;
	}
	public void setAllInss(List<InsBean> allInss) {
		this.allInss = allInss;
	}
	public List<String> getAllTypes() {
		return allTypes;
	}
	public void setAllTypes(List<String> allTypes) {
		this.allTypes = allTypes;
	}
	public List<Integer> getMyInss() {
		return myInss;
	}
	public void setMyInss(List<Integer> myInss) {
		this.myInss = myInss;
	}
	public List<Integer> getOtherInss() {
		return otherInss;
	}
	public void setOtherInss(List<Integer> otherInss) {
		this.otherInss = otherInss;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}	
	