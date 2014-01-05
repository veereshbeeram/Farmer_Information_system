package com.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.LoginBean;
import com.beans.TrainingBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.TrainingService;

public class TrainingAction extends ActionSupport implements SessionAware{
	public static final String classNameToLog = TrainingAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private TrainingService trainingService = new TrainingService();
	private TrainingBean trainingBean = new TrainingBean();
	private Map session;
	
	public void setSession(Map session) 
	{
		this.session = session; 
	}
	public Object getTraining()	{
		return trainingBean;
	}
	@SkipValidation
	public String addTrainingDet(){
		try{
			trainingService.addTrainingDet(trainingBean);
			addActionMessage("Training Schedule Details Added Successfully");
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while inserting training info.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}

	@SkipValidation
	public String getAllTrainingDet(){
		try{
			trainingBean.setAllTrainingDet(trainingService.getAllTrainingDet());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving training info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;			
		}
	}

	@SkipValidation
	public String getTrainingDetFromTid(){
		try{
			trainingBean = trainingService.getTrainingDetFromTid(trainingBean.getTid());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving training info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;			
		}
	}
	@SkipValidation
	public String updateTrainingDet(){
		try{
			logger.debug("updateTrainingDet");
			trainingService.updateTrainingDet(trainingBean);
			addActionMessage("Training Details Updated Successfully");
			trainingBean.setAllTrainingDet(trainingService.getAllTrainingDet());
			logger.debug("finished");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while updating training info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;			
		}
	}
	
	@SkipValidation
	public String prepareTrainingReg(){
		int fid;
		try{
			if(!session.isEmpty()){
				fid = ((LoginBean)session.get("user")).getFid();
				TrainingBean temp = trainingService.getUserDetailsFromFid(fid);
				trainingBean.setUname(temp.getUname());
				trainingBean.getAllOccs().add(temp.getOcc());
				trainingBean.setMyTrainings(trainingService.getTidListFromFid(fid));
				trainingBean.setOtherTrainings(trainingService.getOtherTrainings(fid));
				if(trainingBean.getMyTrainings().size()==0)
					addActionMessage("You have not yet registered for any trainings");
				else
					addActionMessage("You have registered for the following trainings : "+trainingBean.getMyTrainings());
			}
			else{
				trainingBean.getAllOccs().add("Farmer");
				trainingBean.getAllOccs().add("Student");
				trainingBean.getAllOccs().add("Other");
				trainingBean.setOtherTrainings(trainingService.getOtherTrainings(-1));	//will get all tids
			}
			trainingBean.setAllTrainingDet(trainingService.getAllTrainingDet());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving training info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;			
		}
	}
	
	@SkipValidation
	public String registerForTraining(){
		Integer fid=null;
		try{
			if(!session.isEmpty()){
				fid = ((LoginBean)session.get("user")).getFid();
				trainingBean.setFid(fid);
			}
			trainingService.registerForTraining(trainingBean);
			addActionMessage("You have been registered for the selected trainings successfully");
			return prepareTrainingReg();
		}
		catch(Exception e){
			addActionError("There was a problem while registering training info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;			
		}
	}
	
	@SkipValidation
	public String deleteTraining(){
		try{
			trainingService.deleteTraining(trainingBean.getTid());
			addActionMessage("Training Schedule Deleted Successfully");
			trainingBean.setAllTrainingDet(trainingService.getAllTrainingDet());
			return SUCCESS;
			}
			catch(Exception e){
				addActionError("There was a problem while deleting training info.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
}
	
