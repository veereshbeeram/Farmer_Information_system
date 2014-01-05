package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.LoanBean;
import com.beans.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.LoanService;

public class LoanAction extends ActionSupport implements SessionAware{
	public static final String classNameToLog = LoanAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private LoanBean loanBean = new LoanBean();
	private Map ses;
	private LoanService loanService = new LoanService();
	private List<LoanBean> allRepLoans; 
	
	public List<LoanBean> getAllRepLoans(){
		return allRepLoans;
	}
	public void setSession(Map s) 
	{
		this.ses = s; 
	}
	public Object getLoan()
	{
		return loanBean;
	}
	
	//Admin Actions
	public String addLoan()
	{
		try {
			loanService.addLoan(loanBean);
			loanBean = null;		//serves as reset
			addActionMessage("Insertion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteLoan()
	{
		try{
			logger.debug(loanBean.getName());
			loanService.deleteLoan(loanBean);
			addActionMessage("Deletion successful");
			loanBean.setAllLoans(loanService.getAllLoans());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	public String updateLoan()
	{
		try{
			loanService.updateLoan(loanBean);
			addActionMessage("Updation successful");
			loanBean.setAllLoans(loanService.getAllLoans());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllLoans()
	{
		try{
			loanBean.setAllLoans(loanService.getAllLoans());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getLoanDetails(){
	try{
		loanBean = loanService.getLoanDetails(loanBean.getName());
		return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	
	//Farmer Actions
	@SkipValidation
	public String prepareMyLoanView()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		try{
			List<Integer> myLoans = loanService.getMyLoans(fid); 
			loanBean.setAllLoans(loanService.getAllLoans());
			loanBean.setMyLoans(myLoans);
			loanBean.setOtherLoans(loanService.getOtherLoans(fid));	//required for updation of farmer's loan info
			if(myLoans.size()==0)
				addActionMessage("You have not yet added any loan schemes");
			else
				addActionMessage("You have registered for the following loan schemes "+myLoans);
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String deleteOldLoan()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		try {
			loanService.deleteOldLoan(loanBean.getLid(),fid);
			addActionMessage("Deletion successful");
			return prepareMyLoanView();
		}
		catch(Exception e){
			addActionError("There was a problem while updating loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String addNewLoan()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		try{
			loanService.addNewLoan(loanBean.getLid(),fid);
			addActionMessage("Updation successful");
			return prepareMyLoanView();
		}
		catch(Exception e){
			addActionError("There was a problem while updating loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllReportLoans()
	{
		try{
			allRepLoans = loanService.getAllLoans();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving loan information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
}
