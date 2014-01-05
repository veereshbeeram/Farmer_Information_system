package com.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.beans.LocBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LocDao;

public class LocSqlMapDao extends BaseSqlMapDao implements LocDao{
	public static final String classNameToLog = LocDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	public LocSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}

	public void addLoc(LocBean locBean){
		logger.debug("lid = "+(insert("addLoc",locBean)));
		int lid = (Integer)queryForObject("getLocID", locBean.getDistrict());
		Map<String,Integer> locMap = new HashMap<String,Integer>();
		locMap.put("lid",lid);
		List<String> favCrops = locBean.getFavCrops();
		if(favCrops==null)	return;
		Iterator<String> it = favCrops.iterator();
		while(it.hasNext())
		{	
			locMap.put("cid", getCidFromName(it.next()));
			insert("addFavCrop",locMap);
		}
	}
	
	public int getCidFromName(String cropName){
			return (Integer)queryForObject("getCidFromName", cropName);
		}
	
	public List<String> getAllStateNames(){
		return queryForList("getAllStateNames",null);
	}

	public List<LocBean> getAllLocs(){
		return queryForList("getAllLocs",null);
	}

	public void deleteLoc(String districtName){
		delete("deleteLoc",districtName);
	}

	public void	updateLoc(LocBean locBean){
		update("updateLoc",locBean);
	}
	
	public LocBean getLocDetails(String districtName){
		return (LocBean)queryForObject("getLocDetails",districtName);
	}
	public int getLocID(String district){
		return (Integer)queryForObject("getLocID",district);
	}
	
	public List<String> getFavCrops(String district){
		int lid = (Integer)queryForObject("getLocID", district);
		return queryForList("getFavCrops", lid);
	}
	
	public void deleteOldFavCrop(LocBean locBean){
		int lid = (Integer)queryForObject("getLocID", locBean.getDistrict());
		Map<String,Integer> locMap = new HashMap<String,Integer>();
		locMap.put("lid",lid);
		locMap.put("cid", getCidFromName(locBean.getOldFavCrop()));
		delete("deleteOldFavCrop",locMap);
	}
	
	public List<String> getUnfavCrops(String districtName){
		int lid = (Integer)queryForObject("getLocID", districtName);
		return queryForList("getUnfavCrops", lid);
	}

	public void addNewFavCrop(LocBean locBean){
		int lid = (Integer)queryForObject("getLocID", locBean.getDistrict());
		Map<String,Integer> locMap = new HashMap<String,Integer>();
		locMap.put("lid",lid);
		locMap.put("cid", getCidFromName(locBean.getNewFavCrop()));
		insert("addFavCrop", locMap);
	}
}

