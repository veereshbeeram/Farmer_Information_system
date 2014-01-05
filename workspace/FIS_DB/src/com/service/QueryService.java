package com.service;

import java.util.List;

import com.beans.QueryBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.QueryDao;
import com.persistence.sqlmapdao.DaoConfig;

public class QueryService {
	
	private QueryDao queryDao;
	public QueryService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.queryDao = (QueryDao) daoMgr.getDao(QueryDao.class);
	}
	
	public List<String> getOffNames(){
		return queryDao.getOffNames();
	}
	public void postQuery(QueryBean queryBean){
		queryDao.postQuery(queryBean);
	}
	public List<QueryBean> getQueryListFromOffId(int offId){
		return queryDao.getQueryListFromOffId(offId);
	}
	public void addReply(QueryBean queryBean){
		queryDao.addReply(queryBean);
	}
	public List<QueryBean> getQueryListFromFid(int fid){
		return queryDao.getQueryListFromFid(fid);
	}
}
