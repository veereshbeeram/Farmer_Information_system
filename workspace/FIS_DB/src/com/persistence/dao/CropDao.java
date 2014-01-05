package com.persistence.dao;

import java.util.List;

import com.beans.CropBean;
import com.beans.CropFertBean;
import com.beans.CropLocBean;
import com.beans.CropSoilBean;

public interface CropDao {
	
	void addCrop(CropBean cropBean);
	void deleteCrop(CropBean cropBean);
	void updateCrop(CropBean cropBean);
	List<CropBean> getAllCrops();
	List<String> getAllCropNames();
	CropBean getCropDetails(String cropName);
	List<CropBean> getMyCrops(int fid);
	List<String> getOtherCropNames(int fid);
	int getCidFromName(String cropName);
	void deleteOldCrop(String cropName,int fid);
	void addNewCrops(List<String> myNewCropNames,int fid);
	List<String> getFavFerts(int cropid);
	List<String> getUnfavFerts(int cropid);
	void deleteOldFavFert(CropBean CropBean);
	void addNewFavFert(CropBean CropBean);
	List<String> getFavSoils(int cropid);
	List<String> getUnfavSoils(int cropid);
	void deleteOldFavSoil(CropBean CropBean);
	void addNewFavSoil(CropBean CropBean);
	List<CropLocBean> joinCropLoc();
	List<CropFertBean> joinCropFert();
	List<CropSoilBean> joinCropSoil();
}
