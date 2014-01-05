package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.RegisterBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RegisterService;

public class RegisterAction extends ActionSupport{
	public static final String classNameToLog = RegisterAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private RegisterBean registerBean = new RegisterBean();
	private Map session;
	private RegisterService registerService = new RegisterService();
	private List<String> districtsInState;
	private String status,myDistrict;
	
	public Object getReg()	{
		return registerBean;
	}
	public List<String> getDistrictsInState() {
		return districtsInState;
	}
	public void setDistrictsInState(List<String> districtsInState) {
		this.districtsInState = districtsInState;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String register(){
		logger.debug("inside register of RegisterAction");
		try {
			registerService.register(registerBean);
			addActionMessage("Registration successful....Now Login!");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while registering.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getJSON(){
		try{
			logger.debug("inside getjson of RegisterAction");
			setDistrictsInState(registerService.getAllDistrictsInState(registerBean.getState()));
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while registering.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String checkUid(){
		try{
			if(registerService.checkUid(registerBean.getUid())==null)
			{
				status = "is available";
				addActionMessage(registerBean.getUid()+"is available");
			}
			else
			{
				status = "is not available..Please select some other UserID";
				addActionMessage(registerBean.getUid()+"is not available");
			}
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while registering.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	public String updateProfile(){
		try {
			logger.debug("inside update");
			registerService.updateProfile(registerBean);
			addActionMessage("Updation successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating account info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String getMyDistrict() {
		return myDistrict;
	}
	
	@SkipValidation
	public void setMyDistrict(String myDistrict) {
		this.myDistrict = myDistrict;
	}
	
	@SkipValidation
	public String addOfficer(){
		try{
			registerService.addOfficer(registerBean);
			addActionMessage("Officer account added successfully");
			registerBean.setOffUidList(registerService.getOffUidList());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving account info.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteOfficer(){
		try{
			registerService.deleteOff(registerBean.getUid());
			addActionMessage("Officer account deleted successfully");
			registerBean.setOffUidList(registerService.getOffUidList());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while updating info.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String prepareOffAdd(){
		try{
			registerBean.setOffUidList(registerService.getOffUidList());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while updating info.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
}

