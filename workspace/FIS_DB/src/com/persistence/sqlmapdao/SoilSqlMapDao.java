package com.persistence.sqlmapdao;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.SoilBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.SoilDao;

public class SoilSqlMapDao extends BaseSqlMapDao implements SoilDao{
	
	public static final String classNameToLog = SoilDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public SoilSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addSoil(String name){
		insert("addSoil",name);
	}
	public void deleteSoil(String name){
		delete("deleteSoil",name);
	}
	public List<SoilBean> getAllSoils(){
		return queryForList("getAllSoils", null);
	}
}


