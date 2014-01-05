package com.persistence.dao;

import java.util.List;

import com.beans.TrainingBean;


public interface TrainingDao {
	
	void addTrainingDet(TrainingBean trainingBean);
	List<TrainingBean> getAllTrainingDet();
	TrainingBean getTrainingDetFromTid(int tid);
	void updateTrainingDet(TrainingBean trainingBean);
	TrainingBean getUserDetailsFromFid(int fid);
	void registerForTraining(TrainingBean trainingBean);
	List<Integer> getTidListFromFid(int fid);
	List<Integer> getOtherTrainings(int fid);
	void deleteTraining(int tid);
}
