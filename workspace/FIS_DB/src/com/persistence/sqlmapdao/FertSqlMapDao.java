package com.persistence.sqlmapdao;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.FertBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.CropDao;
import com.persistence.dao.FertDao;

public class FertSqlMapDao extends BaseSqlMapDao implements FertDao{
	
	public static final String classNameToLog = CropDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public FertSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addFert(FertBean fertBean){
		insert("addFert",fertBean);
	}
	public void deleteFert(FertBean fertBean){
		delete("deleteFert",fertBean);
	}
	public void updateFert(FertBean fertBean){
		update("updateFert",fertBean);
	}
	public List<FertBean> getAllFerts(){
		return queryForList("getAllFerts", null);
	}
	public List<String> getAllFertNames(){
		return queryForList("getAllFertNames", null);
	}
	public FertBean getFertDetails(String fertName){
		return (FertBean)queryForObject("getFertDetails", fertName);
	}
}


