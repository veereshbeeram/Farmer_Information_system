package com.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.beans.CropBean;
import com.beans.CropLocBean;
import com.beans.CropFertBean;
import com.beans.CropSoilBean;
import com.beans.SoilBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.CropDao;

public class CropSqlMapDao extends BaseSqlMapDao implements CropDao{
	public static final String classNameToLog = CropDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public CropSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addCrop(CropBean cropBean){
		insert("addCrop",cropBean);
		HashMap<String,Integer> cropMap = new HashMap<String,Integer>();
		List<Integer> fertList = cropBean.getFertIDs();
		cropMap.put("cid",getCidFromName(cropBean.getName()));
		Iterator<Integer> it = fertList.iterator();
		while(it.hasNext()){
			cropMap.put("feid", it.next());
			insert("addFavFert",cropMap);
		}
	}
	
	public void deleteCrop(CropBean cropBean){
		delete("deleteCrop", cropBean);
	}
	public void updateCrop(CropBean cropBean){
		update("updateCrop",cropBean);
	}
	public List<CropBean> getAllCrops(){
		return queryForList("getAllCrops",null);
	}
	public List<String> getAllCropNames() {
		return queryForList("getAllCropNames",null);
	}
	public CropBean getCropDetails(String cropName){
		return ((CropBean)queryForObject("getCropDetails",cropName));
	}
	public List<CropBean> getMyCrops(int fid){
		return queryForList("getMyCrops",fid);		
	}
	public List<String> getOtherCropNames(int fid){
		return queryForList("getOtherCropNames",fid);		
	}
	public int getCidFromName(String cropName){
		return (Integer)queryForObject("getCidFromName", cropName);
	}
	public void deleteOldCrop(String cropName,int fid){
		HashMap<String,Integer> myOldCrop = new HashMap<String,Integer>();
		myOldCrop.put("cid",getCidFromName(cropName));
		myOldCrop.put("fid", fid);
		delete("deleteOldCrop",myOldCrop);
	}
	public void addNewCrops(List<String> myNewCropNames,int fid){
		Map<String,Integer> cropMap = new HashMap<String,Integer>();
		cropMap.put("fid",fid);
		Iterator<String> it = myNewCropNames.iterator();
		while(it.hasNext())
		{	
			cropMap.put("cid", getCidFromName(it.next()));
			insert("addNewCrops",cropMap);
		}
	}
	public List<SoilBean> getAllSoils(){
		return queryForList("getAllSoils", null);
	}
	public List<String> getFavFerts(int cropid){
		return queryForList("getFavFerts", cropid);
	}
	public List<String> getUnfavFerts(int cropid){
		return queryForList("getUnfavFerts", cropid);
	}
	public void deleteOldFavFert(CropBean cropBean){
		int cid = (Integer)queryForObject("getCidFromName", cropBean.getName());
		Map<String,Integer> cropMap = new HashMap<String,Integer>();
		cropMap.put("cid",cid);
		int feid = (Integer)queryForObject("getFeidFromName", cropBean.getOldFavFert());
		cropMap.put("feid", feid);
		delete("deleteOldFavFert",cropMap);
	}
	public void addNewFavFert(CropBean cropBean){
		int cid = (Integer)queryForObject("getCidFromName", cropBean.getName());
		Map<String,Integer> cropMap = new HashMap<String,Integer>();
		cropMap.put("cid",cid);
		int feid = (Integer)queryForObject("getFeidFromName", cropBean.getNewFavFert());
		cropMap.put("feid", feid);
		insert("addFavFert", cropMap);
	}
	public List<String> getFavSoils(int cropid){
		return queryForList("getFavSoils", cropid);
	}
	public List<String> getUnfavSoils(int cropid){
		return queryForList("getUnfavSoils", cropid);
	}
	public void deleteOldFavSoil(CropBean cropBean){
		int cid = (Integer)queryForObject("getCidFromName", cropBean.getName());
		Map<String,Integer> cropMap = new HashMap<String,Integer>();
		cropMap.put("cid",cid);
		int sid = (Integer)queryForObject("getSidFromName", cropBean.getOldFavSoil());
		cropMap.put("sid", sid);
		delete("deleteOldFavSoil",cropMap);
	}
	public void addNewFavSoil(CropBean cropBean){
		int cid = (Integer)queryForObject("getCidFromName", cropBean.getName());
		Map<String,Integer> cropMap = new HashMap<String,Integer>();
		cropMap.put("cid",cid);
		int sid = (Integer)queryForObject("getSidFromName", cropBean.getNewFavSoil());
		cropMap.put("sid", sid);
		insert("addFavSoil", cropMap);
	}
	
	public List<CropLocBean> joinCropLoc(){
		return queryForList("joinCropLoc", null);
	}
	
	public List<CropFertBean> joinCropFert(){
		return queryForList("joinCropFert", null);
	}
	public List<CropSoilBean> joinCropSoil(){
		return queryForList("joinCropSoil", null);
	}
}
