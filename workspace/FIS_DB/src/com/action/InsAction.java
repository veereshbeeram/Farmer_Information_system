package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.InsBean;
import com.beans.LoanBean;
import com.beans.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.InsService;

public class InsAction extends ActionSupport implements SessionAware{
	public static final String classNameToLog = InsAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private InsBean insBean = new InsBean();
	private InsService insService = new InsService();
	private Map session;
	private List<InsBean> allRepInss; 
	
	public List<InsBean> getAllRepInss(){
		return allRepInss;
	}
	public void setSession(Map s) 
	{
		this.session = s; 
	}
	public Object getIns()
	{
		return insBean;
	}
	
	//Admin Actions
	public String addIns()
	{
		try {
			insService.addIns(insBean);
			insBean = null;		//serves as reset
			addActionMessage("Insertion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteIns()
	{
		try{
			insService.deleteIns(insBean.getInsID());
			insBean.setAllInss(insService.getAllInss());
			addActionMessage("Deletion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	public String updateIns()
	{
		try{
			insService.updateIns(insBean);
			addActionMessage("Updation successful");
			insBean.setAllInss(insService.getAllInss());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllInss()
	{
		try{
			insBean.setAllInss(insService.getAllInss());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getInsDetails(){
	try{
		insBean = insService.getInsDetails(insBean.getInsID());
		insBean.setAllTypes(insService.getAllTypes());
		return SUCCESS;
	}
		catch(Exception e){
			addActionError("There was a problem while retrieving insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	
	//Farmer Actions
	@SkipValidation
	public String prepareMyInsView()
	{
		int fid = ((LoginBean)session.get("user")).getFid();
		try{
			List<Integer> myInss = insService.getMyInss(fid); 
			insBean.setAllInss(insService.getAllInss());
			insBean.setMyInss(myInss);
			insBean.setOtherInss(insService.getOtherInss(fid));	//required for updation of farmer's loan info
			if(myInss.size()==0)
				addActionMessage("You have not yet added any insurance schemes");
			else
				addActionMessage("You have registered for the following insurance schemes "+myInss);
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String deleteOldIns()
	{
		int fid = ((LoginBean)session.get("user")).getFid();
		try {
			insService.deleteOldIns(insBean.getInsID(),fid);
			addActionMessage("Deletion successful");
			return prepareMyInsView();
		}
		catch(Exception e){
			addActionError("There was a problem while updating insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String addNewIns()
	{
		int fid = ((LoginBean)session.get("user")).getFid();
		try{
			insService.addNewIns(insBean.getInsID(),fid);
			addActionMessage("Updation successful");
			return prepareMyInsView();
		}
		catch(Exception e){
			addActionError("There was a problem while updating insuranceinformation.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllReportInss()
	{
		try{
			allRepInss=insService.getAllInss();
			int cropIns=insService.getCropCount();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving insurance information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
}
