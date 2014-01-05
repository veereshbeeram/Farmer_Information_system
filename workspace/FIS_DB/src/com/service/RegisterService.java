package com.service;

import java.util.List;

import com.beans.RegisterBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.RegisterDao;
import com.persistence.sqlmapdao.DaoConfig;

public class RegisterService {
	
	private RegisterDao registerDao;
	public RegisterService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.registerDao = (RegisterDao)daoMgr.getDao(RegisterDao.class);
	}
	public List<String> getAllDistrictsInState(String stateName){
		return registerDao.getDistrictsInState(stateName);
	}
	
	public void register(RegisterBean registerBean){
		registerDao.register(registerBean);
	}
	public String checkUid(String uid){
		return registerDao.checkUid(uid);
	}
	public RegisterBean getUserDetails(int fid){
		return registerDao.getUserDetails(fid);
	}
	public void updateProfile(RegisterBean registerBean){
		registerDao.updateProfile(registerBean);
	}
	public void addOfficer(RegisterBean registerBean){
		registerDao.addOfficer(registerBean);
	}
	public void deleteOff(String uid){
		registerDao.deleteOff(uid);
	}
	public List<String> getOffUidList(){
		return registerDao.getOffUidList();
	}
}
