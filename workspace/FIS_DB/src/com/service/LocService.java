package com.service;

import java.util.List;

import com.beans.LocBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LocDao;
import com.persistence.sqlmapdao.DaoConfig;

public class LocService {
	
	private LocDao locDao;
	public LocService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.locDao = (LocDao)daoMgr.getDao(LocDao.class);
	}
	
	public List<LocBean> getAllLocs(){
		return locDao.getAllLocs();
	}
	public void addLoc(LocBean locBean){
		locDao.addLoc(locBean);
	}
	public List<String> getAllStateNames(){
		return locDao.getAllStateNames();
	}
	public void deleteLoc(String districtName){
		locDao.deleteLoc(districtName);
	}
	public void	updateLoc(LocBean locBean){
		locDao.updateLoc(locBean);
	}
	public LocBean getLocDetails(String districtName){
		return locDao.getLocDetails(districtName);
	}
	public List<String> getFavCrops(String district){
		return locDao.getFavCrops(district);
	}
	public void deleteOldFavCrop(LocBean locBean){
		locDao.deleteOldFavCrop(locBean);
	}
	public List<String> getUnfavCrops(String districtName){
		return locDao.getUnfavCrops(districtName);
	}
	public void addNewFavCrop(LocBean locBean){
		locDao.addNewFavCrop(locBean);
	}
}
