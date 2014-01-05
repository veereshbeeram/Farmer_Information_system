package com.action;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.FertBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.FertService;

public class FertAction extends ActionSupport{
	
	public static final String classNameToLog = FertAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private FertBean fertBean = new FertBean();
	private FertService fertService = new FertService();
	
	public Object getFert()
	{
		return fertBean;
	}

	public String addFert()
	{
		try {
				fertService.addFert(fertBean);
				fertBean = null;		//serves as reset
				addActionMessage("Insertion successful");
				return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while inserting fert information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
				}
	}
	
	@SkipValidation
	public String deleteFert()
	{
		try{
			logger.debug(fertBean.getDescription());
			fertService.deleteFert(fertBean);
			addActionMessage("Deletion successful");
			fertBean.setAllFerts(fertService.getAllFerts());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting fert information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	public String updateFert()
	{
		try{
			fertService.updateFert(fertBean);
			addActionMessage("Updation successful");
			fertBean.setAllFerts(fertService.getAllFerts());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating fert information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getFertDetails()
	{
		try{
			fertBean = fertService.getFertDetails(fertBean.getDescription());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving fert information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String getAllFerts()
	{
		try{
			fertBean.setAllFerts(fertService.getAllFerts());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving fert information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
}
	