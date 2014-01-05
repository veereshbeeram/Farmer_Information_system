package com.persistence.sqlmapdao;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.QueryBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.CropDao;
import com.persistence.dao.QueryDao;

public class QuerySqlMapDao extends BaseSqlMapDao implements QueryDao{
	
	public static final String classNameToLog = CropDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public QuerySqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public List<String> getOffNames(){
		return queryForList("getOffNames",null);
	}
	public void postQuery(QueryBean queryBean){
		int offId;
		if(queryBean.getOffName().equals(""))
			offId = 0;
		else
			offId = (Integer)queryForObject("getOffIdFromName", queryBean.getOffName());
		queryBean.setOffId(offId);
		insert("postQuery",queryBean);
	}
	public List<QueryBean> getQueryListFromOffId(int offId){
		return queryForList("getQueryListFromOffId", offId);
	}
	public void addReply(QueryBean queryBean){
		insert("addReply",queryBean);
	}
	public List<QueryBean> getQueryListFromFid(int fid){
		return queryForList("getQueryListFromFid", fid);
	}
}


