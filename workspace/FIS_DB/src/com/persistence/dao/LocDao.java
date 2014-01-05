package com.persistence.dao;

import java.util.List;

import com.beans.LocBean;

public interface LocDao {
	
	void addLoc(LocBean locBean);
	void deleteLoc(String districtName);
	void updateLoc(LocBean locBean);
	List<String> getAllStateNames();
	List<LocBean> getAllLocs();
	List<String> getFavCrops(String districtName);
	LocBean getLocDetails(String districtName);
	void deleteOldFavCrop(LocBean locBean);
	List<String> getUnfavCrops(String districtName);
	void addNewFavCrop(LocBean locBean);
}
