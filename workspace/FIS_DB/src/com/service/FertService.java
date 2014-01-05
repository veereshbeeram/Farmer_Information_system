package com.service;

import java.util.List;

import com.beans.FertBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.FertDao;
import com.persistence.sqlmapdao.DaoConfig;

public class FertService {
	
	private FertDao fertDao;
	public FertService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.fertDao = (FertDao) daoMgr.getDao(FertDao.class);
	}
	public void addFert(FertBean fertBean){
		fertDao.addFert(fertBean);
	}
	public void updateFert(FertBean fertBean){
		fertDao.updateFert(fertBean);
	}
	public void deleteFert(FertBean fertBean){
		fertDao.deleteFert(fertBean);
	}
	public List<FertBean> getAllFerts(){
		return fertDao.getAllFerts();
	}
	public List<String> getAllFertNames(){
		return fertDao.getAllFertNames();
	}
	public FertBean getFertDetails(String fertName){
		return fertDao.getFertDetails(fertName);
	}
}
