package com.persistence.dao;

import java.util.List;

import com.beans.RegisterBean;

public interface RegisterDao {
	
	List<String> getDistrictsInState(String stateName);
	void register(RegisterBean registerBean);
	String checkUid(String uid);
	RegisterBean getUserDetails(int fid);
	void updateProfile(RegisterBean registerBean);
	void addOfficer(RegisterBean registerBean);
	void deleteOff(String uid);
	List<String> getOffUidList();
}
