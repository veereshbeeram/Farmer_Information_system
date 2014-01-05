package com.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.beans.LoanBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LoanDao;

public class LoanSqlMapDao extends BaseSqlMapDao implements LoanDao{
	public static final String classNameToLog = LoanDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public LoanSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addLoan(LoanBean loanBean){
		insert("addLoan",loanBean);
	}
	public void deleteLoan(LoanBean loanBean){
		delete("deleteLoan", loanBean);
	}
	public void updateLoan(LoanBean loanBean){
		update("updateLoan",loanBean);
	}
	public List<LoanBean> getAllLoans(){
		return queryForList("getAllLoans",null);
	}
	public List<String> getAllLoanNames() {
		return queryForList("getAllLoanNames",null);
	}
	public LoanBean getLoanDetails(String loanName){
		return ((LoanBean)queryForObject("getLoanDetails",loanName));
	}
	public List<Integer> getMyLoans(int fid){
		return queryForList("getMyLoans",fid);		
	}
	public List<Integer> getOtherLoans(int fid){
		return queryForList("getOtherLoans",fid);		
	}
	public int getLidFromName(String loanName){
		return (Integer)queryForObject("getLidFromName", loanName);
	}
	public void deleteOldLoan(int lid,int fid){
		HashMap<String,Integer> myOldLoan = new HashMap<String,Integer>();
		myOldLoan.put("lid",lid);
		myOldLoan.put("fid", fid);
		delete("deleteOldLoan",myOldLoan);
	}
	public void addNewLoan(int lid,int fid){
		Map<String,Integer> loanMap = new HashMap<String,Integer>();
		loanMap.put("fid",fid);
		loanMap.put("lid", lid);
		insert("addNewLoan",loanMap);
		update("addCount",lid);
	}
}
