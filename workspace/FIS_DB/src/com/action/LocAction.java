package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.LocBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.LocService;

public class LocAction extends ActionSupport implements ApplicationAware{
	private LocService locService = new LocService();
	private LocBean locBean = new LocBean();
	private Map app;	
	public static final String classNameToLog = LocAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public void setApplication(Map app) 
	{
		this.app = app; 
	}
	public Object getLoc()
	{
		return locBean;
	}
	

	public String addLoc()
	{
		try {
			locService.addLoc(locBean);
			locBean = null;		//serves as reset
			addActionMessage("Insertion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting loc information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteLoc()
	{
		try{
			locService.deleteLoc(locBean.getDistrict());
			addActionMessage("Deletion successful");
			locBean.setAllLocs(locService.getAllLocs());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting loc information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	public String updateLoc()
	{
		try{
			locService.updateLoc(locBean);
			addActionMessage("Updation successful");
			locBean.setAllLocs(locService.getAllLocs());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating loc information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllLocs()
	{
		try{
			locBean.setAllLocs(locService.getAllLocs());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getLocDetails(){
	try{
		locBean = locService.getLocDetails(locBean.getDistrict());
		return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving loc information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getFavCrops()
	{
		try{
			locBean.setFavCrops(locService.getFavCrops(locBean.getDistrict()));
			locBean.setUnFavCrops(locService.getUnfavCrops(locBean.getDistrict()));
			List<String> favCrops = locBean.getFavCrops();
			if(favCrops.size()==0)
				addActionMessage("No favourable crops have been selected for this location yet");
			else
				addActionMessage("Current List of favourable crops : "+locBean.getFavCrops());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving loc information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	
	@SkipValidation
	public String deleteOldFavCrop()
	{
		try{
			logger.debug("param = "+locBean.getDistrict());
			locService.deleteOldFavCrop(locBean);
			
			return getFavCrops();
			}
			catch(Exception e){
				addActionError("There was a problem while updating loc information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String addNewFavCrop(){
		try{
			locService.addNewFavCrop(locBean);
			return getFavCrops();
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving loc information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
}
