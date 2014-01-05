package com.service;

import java.util.List;

import com.beans.ToolBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.ToolDao;
import com.persistence.sqlmapdao.DaoConfig;

public class ToolService {
	
	private ToolDao toolDao;
	public ToolService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.toolDao = (ToolDao) daoMgr.getDao(ToolDao.class);
	}
	
	public void addTool(ToolBean toolBean){
		toolDao.addTool(toolBean);
	}
	public List<ToolBean> getAllTools(){
		  return toolDao.getAllTools();
	}
	public void deleteTool(int tID){
		toolDao.deleteTool(tID);
	}
	public String getFileName(int tID){
		return toolDao.getFileName(tID);
	}
}
