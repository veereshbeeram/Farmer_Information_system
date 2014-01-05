package com.service;

import java.util.List;

import com.beans.InsBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.InsDao;
import com.persistence.sqlmapdao.DaoConfig;

public class InsService {
	
	private InsDao insDao;
	public InsService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.insDao = (InsDao) daoMgr.getDao(InsDao.class);
	}
	public void addIns(InsBean insBean){
		insDao.addIns(insBean);
	}
	public void updateIns(InsBean insBean){
		insDao.updateIns(insBean);
	}
	public void deleteIns(int insID){
		insDao.deleteIns(insID);
	}
	public List<InsBean> getAllInss(){
		return insDao.getAllInss();
	}
	public List<String> getAllInsNames(){
		return insDao.getAllInsNames();
	}
	public InsBean getInsDetails(int insID){
		return insDao.getInsDetails(insID);
	}
	public List<String> getAllTypes(){
		return insDao.getAllTypes();
	}
	public List<Integer> getMyInss(int fid){
		return insDao.getMyInss(fid);
	}
	public List<Integer> getOtherInss(int fid){
		return insDao.getOtherInss(fid);
	}
	public void deleteOldIns(int insID,int fid){
		insDao.deleteOldIns(insID,fid);
	}
	public void addNewIns(int insID,int fid){
		insDao.addNewIns(insID,fid);
	}
	public int getCropCount(){
		return insDao.getCropCount();
	}
}
