package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.CropBean;
import com.beans.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CropService;
import com.service.FertService;

public class CropAction extends ActionSupport implements SessionAware{
	public static final String classNameToLog = CropAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private CropBean cropBean = new CropBean();
	private Map ses;
	private CropService cropService = new CropService();
	
	public void setSession(Map s) 
	{
		this.ses = s; 
	}
	public Object getCrop()
	{
		return cropBean;
	}
	
	//Admin Actions
	
	@SkipValidation
	public String prepareAddCrop()
	{
		try{
			cropBean.setAllFertilisers(cropService.getAllFerts());
			cropBean.setAllSoils(cropService.getAllSoils());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrievenig fertiliser information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}	
	
	public String addCrop()
	{
		try {
			logger.debug("addCrop = "+cropBean.getFertIDs());
			cropService.addCrop(cropBean);
			cropBean.reset();
			addActionMessage("Insertion Successful");
			return prepareAddCrop();
		}
		catch(Exception e){
			addActionError("There was a problem while inserting crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteCrop()
	{
		try{
			logger.debug(cropBean.getName());
			cropService.deleteCrop(cropBean);
			addActionMessage("Deletion successful");
			cropBean.setAllCrops(cropService.getAllCrops());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	
	public String updateCrop()
	{
		try{
			cropService.updateCrop(cropBean);
			addActionMessage("Updation successful");
			cropBean.setAllCrops(cropService.getAllCrops());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getAllCrops()
	{
		try{
			cropBean.setAllCrops(cropService.getAllCrops());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getCropDetails(){
	try{
		cropBean = cropService.getCropDetails(cropBean.getName());
		return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	
	//Farmer Actions
	@SkipValidation
	public String getMyCrops()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		try{
			cropBean.setMyCrops(cropService.getMyCrops(fid));
			cropBean.setOtherCropNames(cropService.getOtherCropNames(fid));	//required for updation of farmer's crop info
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String deleteOldCrop()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		try {
			cropBean.setMyCrops(cropService.getMyCrops(fid));
			if(cropBean.getMyCrops().size()==1)
			{
				addActionError("Minimum Crop Requirement Violation!");
				cropBean.setMyCrops(cropService.getMyCrops(fid));
				cropBean.setOtherCropNames(cropService.getOtherCropNames(fid));
				return INPUT;
			}
			cropService.deleteOldCrop(cropBean.getName(),fid);
			addActionMessage("Deletion successful");
			cropBean.setMyCrops(cropService.getMyCrops(fid));
			cropBean.setOtherCropNames(cropService.getOtherCropNames(fid));
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String addNewCrops()
	{
		int fid = ((LoginBean)ses.get("user")).getFid();
		
		try{
			cropBean.setMyCrops(cropService.getMyCrops(fid));
			cropService.addNewCrops(cropBean.getMyCropNames(),fid);
			addActionMessage("Updation successful");
			cropBean.setMyCrops(cropService.getMyCrops(fid));
			cropBean.setOtherCropNames(cropService.getOtherCropNames(fid));
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating crop information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getFavFerts()
	{
		try{
			int cid = cropService.getCidFromName(cropBean.getName());
			cropBean.setFavFerts(cropService.getFavFerts(cid));
			cropBean.setUnfavFerts(cropService.getUnfavFerts(cid));
			List<String> favFerts = cropBean.getFavFerts();
			if(favFerts.size()==0)
				addActionMessage("No suitable fertilisers have been selected yet");
			else
				addActionMessage("Current List of suitable fertilisers : "+cropBean.getFavFerts());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving fertiliser information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	
	@SkipValidation
	public String deleteOldFavFert()
	{
		try{
			cropService.deleteOldFavFert(cropBean);
			
			return getFavFerts();
			}
			catch(Exception e){
				addActionError("There was a problem while updating fertiliser information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String addNewFavFert(){
		try{
			cropService.addNewFavFert(cropBean);
			return getFavFerts();
			}
			catch(Exception e){
				addActionError("There was a problem while updating fertiliserinformation.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	@SkipValidation
	public String getFavSoils()
	{
		try{
			int cid = cropService.getCidFromName(cropBean.getName());
			cropBean.setFavSoils(cropService.getFavSoils(cid));
			cropBean.setUnfavSoils(cropService.getUnfavSoils(cid));
			List<String> favSoils = cropBean.getFavSoils();
			if(favSoils.size()==0)
				addActionMessage("No suitable soils have been selected yet");
			else
				addActionMessage("Current List of suitable soils: "+cropBean.getFavSoils());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while retrieving soil information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	
	@SkipValidation
	public String deleteOldFavSoil()
	{
		try{
			cropService.deleteOldFavSoil(cropBean);
			
			return getFavSoils();
			}
			catch(Exception e){
				addActionError("There was a problem while updating soil information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String addNewFavSoil(){
		try{
			cropService.addNewFavSoil(cropBean);
			return getFavSoils();
			}
			catch(Exception e){
				addActionError("There was a problem while updating soil information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	public void validate(){
		if(hasFieldErrors()){			//prepare addCrop
			cropBean.setAllFertilisers(cropService.getAllFerts());
			cropBean.setAllSoils(cropService.getAllSoils());
		}
	}
}
