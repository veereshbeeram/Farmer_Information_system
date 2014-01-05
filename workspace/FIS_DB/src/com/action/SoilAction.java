package com.action;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.SoilBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.SoilService;

public class SoilAction extends ActionSupport{
	
	public static final String classNameToLog = SoilAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private SoilBean soilBean = new SoilBean();
	private SoilService soilService = new SoilService();
	
	public Object getSoil()
	{
		return soilBean;
	}

	public String addSoil()
	{
		try {
				soilService.addSoil(soilBean.getName());
				soilBean.setName(null) ;		//serves as reset
				addActionMessage("Insertion successful");
				return getAllSoils();
			}
			catch(Exception e){
				addActionError("There was a problem while inserting soil information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
				}
	}
	
	@SkipValidation
	public String deleteSoil()
	{
		try{
			logger.debug(soilBean.getName());
			soilService.deleteSoil(soilBean.getName());
			soilBean.setName(null);
			addActionMessage("Deletion successful");
			return getAllSoils();
		}
		catch(Exception e){
			addActionError("There was a problem while deleting soil information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	
	@SkipValidation
	public String getAllSoils()
	{
		try{
			soilBean.setAllSoils(soilService.getAllSoils());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving soil information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
}
	