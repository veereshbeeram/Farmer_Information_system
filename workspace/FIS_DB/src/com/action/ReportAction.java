package com.action;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.CropFertBean;
import com.beans.CropLocBean;
import com.beans.CropSoilBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CropService;

public class ReportAction extends ActionSupport{
	public static final String classNameToLog = ReportAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private CropService cropService = new CropService();
	private List<CropLocBean> cropLocBeanList;
	private List<CropFertBean> cropFertBeanList;
	private List<CropSoilBean> cropSoilBeanList;
	
	public List<CropLocBean> getCropLocBeanList(){
		return cropLocBeanList;
	}
	public List<CropFertBean> getCropFertBeanList(){
		return cropFertBeanList;
	}
	public List<CropSoilBean> getCropSoilBeanList(){
		return cropSoilBeanList;
	}
	public String joinCropLoc(){
		try{
			cropLocBeanList = cropService.joinCropLoc();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while generating report.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String joinCropFert(){
		try{
			cropFertBeanList = cropService.joinCropFert();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while generating report.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	public String joinCropSoil(){
		try{
			cropSoilBeanList = cropService.joinCropSoil();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while generating report.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
}
