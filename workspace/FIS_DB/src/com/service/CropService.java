package com.service;

import java.util.List;

import com.beans.CropBean;
import com.beans.CropFertBean;
import com.beans.CropSoilBean;
import com.beans.FertBean;
import com.beans.CropLocBean;
import com.beans.SoilBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.CropDao;
import com.persistence.dao.FertDao;
import com.persistence.dao.SoilDao;
import com.persistence.sqlmapdao.DaoConfig;

public class CropService {
	
	private CropDao cropDao;
	private SoilDao soilDao;
	private FertDao fertDao;
	public CropService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.cropDao = (CropDao) daoMgr.getDao(CropDao.class);
	    this.soilDao = (SoilDao) daoMgr.getDao(SoilDao.class);
	    this.fertDao = (FertDao) daoMgr.getDao(FertDao.class);
	}
	public void addCrop(CropBean cropBean){
		cropDao.addCrop(cropBean);
	}
	public void updateCrop(CropBean cropBean){
		cropDao.updateCrop(cropBean);
	}
	public void deleteCrop(CropBean cropBean){
		cropDao.deleteCrop(cropBean);
	}
	public List<CropBean> getAllCrops(){
		return cropDao.getAllCrops();
	}
	public List<String> getAllCropNames(){
		return cropDao.getAllCropNames();
	}
	public CropBean getCropDetails(String cropName){
		return cropDao.getCropDetails(cropName);
	}
	public List<CropBean> getMyCrops(int fid){
		return cropDao.getMyCrops(fid);
	}
	public List<String> getOtherCropNames(int fid){
		return cropDao.getOtherCropNames(fid);
	}
	public int getCidFromName(String cropName){
		return cropDao.getCidFromName(cropName);
	}
	public void deleteOldCrop(String cropName,int fid){
		cropDao.deleteOldCrop(cropName,fid);
	}
	public void addNewCrops(List<String> myNewCropNames,int fid){
		cropDao.addNewCrops(myNewCropNames,fid);
	}
	public List<SoilBean> getAllSoils(){
		return soilDao.getAllSoils();
	}
	public List<FertBean> getAllFerts(){
		return fertDao.getAllFerts();
	}
	public List<String> getFavFerts(int cropid){
		return cropDao.getFavFerts(cropid);
	}
	public List<String> getUnfavFerts(int cropid){
		return cropDao.getUnfavFerts(cropid);
	}
	public void deleteOldFavFert(CropBean cropBean){
		cropDao.deleteOldFavFert(cropBean);
	}
	public void addNewFavFert(CropBean cropBean){
		cropDao.addNewFavFert(cropBean);
	}
	public List<String> getFavSoils(int cropid){
		return cropDao.getFavSoils(cropid);
	}
	public List<String> getUnfavSoils(int cropid){
		return cropDao.getUnfavSoils(cropid);
	}
	public void deleteOldFavSoil(CropBean cropBean){
		cropDao.deleteOldFavSoil(cropBean);
	}
	public void addNewFavSoil(CropBean cropBean){
		cropDao.addNewFavSoil(cropBean);
	}
	public List<CropLocBean> joinCropLoc(){
		return cropDao.joinCropLoc();
	}
	public List<CropFertBean> joinCropFert(){
		return cropDao.joinCropFert();
	}
	public List<CropSoilBean> joinCropSoil(){
		return cropDao.joinCropSoil();
	}
}
