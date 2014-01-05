package com.persistence.dao;

import java.util.List;
import com.beans.FertBean;

public interface FertDao {
	
	void addFert(FertBean fertBean);
	void deleteFert(FertBean fertBean);
	void updateFert(FertBean fertBean);
	List<FertBean> getAllFerts();
	List<String> getAllFertNames();
	FertBean getFertDetails(String fertName);
}
