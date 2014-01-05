package com.service;

import java.util.List;

import com.beans.TrainingBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.TrainingDao;
import com.persistence.sqlmapdao.DaoConfig;

public class TrainingService {
	
	private TrainingDao trainingDao;
	public TrainingService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.trainingDao = (TrainingDao) daoMgr.getDao(TrainingDao.class);
	}
	
	public void addTrainingDet(TrainingBean trainingBean){
		trainingDao.addTrainingDet(trainingBean);
	}
	public List<TrainingBean> getAllTrainingDet(){
		return trainingDao.getAllTrainingDet();
	}
	public TrainingBean getTrainingDetFromTid(int tid){
		return trainingDao.getTrainingDetFromTid(tid);
	}
	public void updateTrainingDet(TrainingBean trainingBean){
		trainingDao.updateTrainingDet(trainingBean);
	}
	public TrainingBean getUserDetailsFromFid(int fid){
		return trainingDao.getUserDetailsFromFid(fid);
	}
	public void registerForTraining(TrainingBean trainingBean){
		trainingDao.registerForTraining(trainingBean);
	}
	public List<Integer> getTidListFromFid(int fid){
		return trainingDao.getTidListFromFid(fid);
	}
	public List<Integer> getOtherTrainings(int fid){
		 return trainingDao.getOtherTrainings(fid);
	 }
	public void deleteTraining(int tid){
		trainingDao.deleteTraining(tid);
	}
}