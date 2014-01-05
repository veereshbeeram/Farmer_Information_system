package com.persistence.dao;

import java.util.List;

import com.beans.LoanBean;

public interface LoanDao {
	
	void addLoan(LoanBean loanBean);
	void deleteLoan(LoanBean loanBean);
	void updateLoan(LoanBean loanBean);
	List<LoanBean> getAllLoans();
	List<String> getAllLoanNames();
	LoanBean getLoanDetails(String loanName);
	List<Integer> getMyLoans(int fid);
	List<Integer> getOtherLoans(int fid);
	void deleteOldLoan(int lid,int fid);
	void addNewLoan(int lid,int fid);
}
