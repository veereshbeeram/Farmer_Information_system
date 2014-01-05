package com.persistence.dao;

import java.util.List;

import com.beans.InsBean;

public interface InsDao {
	
	void addIns(InsBean insBean);
	void deleteIns(int insID);
	void updateIns(InsBean insBean);
	InsBean getInsDetails(int insID);
	List<InsBean> getAllInss();
	List<String> getAllInsNames();
	List<String> getAllTypes();
	List<Integer> getMyInss(int fid);
	List<Integer> getOtherInss(int fid);
	void deleteOldIns(int insID,int fid);
	void addNewIns(int insiD,int fid);
	int getCropCount();
}
