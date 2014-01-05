package com.service;

import java.util.List;

import com.beans.LoanBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LoanDao;
import com.persistence.sqlmapdao.DaoConfig;

public class LoanService {
	
	private LoanDao loanDao;
	public LoanService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.loanDao = (LoanDao) daoMgr.getDao(LoanDao.class);
	}
	public void addLoan(LoanBean loanBean){
		loanDao.addLoan(loanBean);
	}
	public void updateLoan(LoanBean loanBean){
		loanDao.updateLoan(loanBean);
	}
	public void deleteLoan(LoanBean loanBean){
		loanDao.deleteLoan(loanBean);
	}
	public List<LoanBean> getAllLoans(){
		return loanDao.getAllLoans();
	}
	public List<String> getAllLoanNames(){
		return loanDao.getAllLoanNames();
	}
	public LoanBean getLoanDetails(String loanName){
		return loanDao.getLoanDetails(loanName);
	}
	public List<Integer> getMyLoans(int fid){
		return loanDao.getMyLoans(fid);
	}
	public List<Integer> getOtherLoans(int fid){
		return loanDao.getOtherLoans(fid);
	}
	public void deleteOldLoan(int lid,int fid){
		loanDao.deleteOldLoan(lid,fid);
	}
	public void addNewLoan(int lid,int fid){
		loanDao.addNewLoan(lid,fid);
	}
}
