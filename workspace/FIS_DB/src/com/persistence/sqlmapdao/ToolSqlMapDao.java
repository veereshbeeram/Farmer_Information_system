package com.persistence.sqlmapdao;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.ToolBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.ToolDao;

public class ToolSqlMapDao extends BaseSqlMapDao implements ToolDao{
	public static final String classNameToLog = ToolDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public ToolSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addTool(ToolBean toolBean){
		insert("addTool", toolBean);
	}
	public List<ToolBean> getAllTools(){
		  return queryForList("getAllTools",null);
	}
	public void deleteTool(int tID){
		delete("deleteTool",tID);
	}
	public String getFileName(int tID){
		return (String)queryForObject("getFileName", tID);
	}
}
