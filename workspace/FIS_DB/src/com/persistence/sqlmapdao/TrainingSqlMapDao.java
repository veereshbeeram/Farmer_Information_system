package com.persistence.sqlmapdao;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.beans.TrainingBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.TrainingDao;

public class TrainingSqlMapDao extends BaseSqlMapDao implements TrainingDao{
	public static final String classNameToLog = TrainingDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public TrainingSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addTrainingDet(TrainingBean trainingBean){
		insert("addTrainingDet",trainingBean);
	}
	public List<TrainingBean> getAllTrainingDet(){
		return queryForList("getAllTrainingDet",null);
	}
	public TrainingBean getTrainingDetFromTid(int tid){
		return (TrainingBean)queryForObject("getTrainingDetFromTid", tid);
	}
	public void updateTrainingDet(TrainingBean trainingBean){
		update("updateTrainingDet",trainingBean);
	}
	public TrainingBean getUserDetailsFromFid(int fid){
		return (TrainingBean)queryForObject("getUserDetailsFromFid", fid);
	}
	public void registerForTraining(TrainingBean trainingBean){
		List<Integer> trainings = trainingBean.getMyTrainings();
		Iterator<Integer> it = trainings.iterator();
		while(it.hasNext()){
			trainingBean.setTid(it.next());
			insert("registerForTraining",trainingBean);
			update("incRegCount", trainingBean.getTid()	);
			if(trainingBean.getFid()!=null)
				insert("registerUserForTraining",trainingBean);
		}
	}
	public List<Integer> getTidListFromFid(int fid){
		return queryForList("getTidListFromFid", fid);
	}
	 public List<Integer> getOtherTrainings(int fid){
		 return queryForList("getOtherTrainings",fid);
	 }
	 public void deleteTraining(int tid){
		 delete("deleteTraining",tid);
	 }
}
