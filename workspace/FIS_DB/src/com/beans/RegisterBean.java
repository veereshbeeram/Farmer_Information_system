package com.beans;
import java.util.List;

public class RegisterBean {
	
	private String name,state,district,uid,pwd,confirmPwd,address,occupation;
	private Integer age,income,fid,locId;
	private List<StateBean> states;
	private List<DependantBean> dependant;
	private List<String> myCrops,allCrops;
	private List<String> offUidList;
	
	public List<StateBean> getStates() {
		return states;
	}
	public void setStates(List<StateBean> states) {
		this.states = states;
	}
	public List<String> getOffUidList() {
		return offUidList;
	}
	public void setOffUidList(List<String> offUidList) {
		this.offUidList = offUidList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		System.out.println("RegBean : setState");
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public List<StateBean> getStateValues() {
		return states;
	}
	public void setStateValues(List<StateBean> states) {
		this.states = states;
	}
	public Integer getIncome() {
		return income;
	}
	public void setIncome(Integer income) {
		this.income = income;
	}
	public List<DependantBean> getDependant() {
		return dependant;
	}
	public void setDependant(List<DependantBean> dependant) {
		this.dependant = dependant;
	}
	public List<String> getMyCrops() {
		return myCrops;
	}
	public void setMyCrops(List<String> myCrops) {
		this.myCrops = myCrops;
	}
	public List<String> getAllCrops() {
		return allCrops;
	}
	public void setAllCrops(List<String> allCrops) {
		this.allCrops = allCrops;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public Integer getLocId() {
		return locId;
	}
	public void setLocId(Integer locId) {
		this.locId = locId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}
}
	


