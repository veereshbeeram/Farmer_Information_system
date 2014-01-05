package com.beans;

import java.util.ArrayList;
import java.util.List;

public class TrainingBean {

	private String description,address,time,name,uname,occ,status;
	private Integer tid,maxCount,duration,contact,fid,regCount;
	private List<TrainingBean> allTrainingDet;
	private List<Integer> myTrainings,otherTrainings;
	private List<String> allOccs = new ArrayList<String>();
	
	public String toString(){
		if(regCount<maxCount)
			status="Available";
		else
			status="Not Available";
		return status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public List<TrainingBean> getAllTrainingDet() {
		return allTrainingDet;
	}
	public void setAllTrainingDet(List<TrainingBean> allTrainingDet) {
		this.allTrainingDet = allTrainingDet;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getOcc() {
		return occ;
	}
	public void setOcc(String occ) {
		this.occ = occ;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public void setMaxCount(Integer maxCount) {
		this.maxCount = maxCount;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public void setContact(Integer contact) {
		this.contact = contact;
	}
	public List<String> getAllOccs() {
		return allOccs;
	}
	public void setAllOccs(List<String> allOccs) {
		this.allOccs = allOccs;
	}
	public List<Integer> getMyTrainings() {
		return myTrainings;
	}
	public void setMyTrainings(List<Integer> myTrainings) {
		this.myTrainings = myTrainings;
	}
	public List<Integer> getOtherTrainings() {
		return otherTrainings;
	}
	public void setOtherTrainings(List<Integer> otherTrainings) {
		this.otherTrainings = otherTrainings;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Integer getRegCount() {
		return regCount;
	}
	public void setRegCount(Integer regCount) {
		this.regCount = regCount;
	}
	public Integer getTid() {
		return tid;
	}
	public Integer getMaxCount() {
		return maxCount;
	}
	public Integer getDuration() {
		return duration;
	}
	public Integer getContact() {
		return contact;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
