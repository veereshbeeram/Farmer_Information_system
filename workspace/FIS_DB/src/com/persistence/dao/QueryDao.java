package com.persistence.dao;

import java.util.List;
import com.beans.QueryBean;

public interface QueryDao {
	
	List<String> getOffNames();
	void postQuery(QueryBean queryBean);
	List<QueryBean> getQueryListFromOffId(int offId);
	void addReply(QueryBean queryBean);
	List<QueryBean> getQueryListFromFid(int fid);
}
