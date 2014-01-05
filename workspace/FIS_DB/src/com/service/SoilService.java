package com.service;

import java.util.List;

import com.beans.SoilBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.SoilDao;
import com.persistence.sqlmapdao.DaoConfig;

public class SoilService {
	
	private SoilDao soilDao;
	public SoilService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.soilDao = (SoilDao) daoMgr.getDao(SoilDao.class);
	}
	public void addSoil(String name){
		soilDao.addSoil(name);
	}
	public void deleteSoil(String name){
		soilDao.deleteSoil(name);
	}
	public List<SoilBean> getAllSoils(){
		return soilDao.getAllSoils();
	}
}
