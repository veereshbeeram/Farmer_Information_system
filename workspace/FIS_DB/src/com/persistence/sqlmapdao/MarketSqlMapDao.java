package com.persistence.sqlmapdao;

import java.util.List;

import org.apache.log4j.Logger;

import com.beans.MarketBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.MarketDao;

public class MarketSqlMapDao extends BaseSqlMapDao implements MarketDao{
	public static final String classNameToLog = MarketDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	public MarketSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}

	public int getCropId(String cropName){
		return (Integer)queryForObject("getCropId", cropName);
	}
	
	public int getLocId(String marketName){
		return (Integer)queryForObject("getLocIdFromMarketName", marketName);
	}
	
	public float getPriceOfCrop(MarketBean marketBean){
		Object o = queryForObject("getPriceOfCrop", marketBean);
		if(o!=null)
			return (Float)o;
		else
			 return 0;
	}
	
	public List<String> getAllMarketNames(){
		return queryForList("getAllMarketNames", null);
	}
	
	public void addCropPrice(MarketBean marketBean){
		insert("addCropPrice", marketBean);
	}
	public List<MarketBean> getAllCropPricesFromMarket(int locid){
		return queryForList("getAllCropPricesFromMarket", locid);
	}
	public List<MarketBean> getMarketPricesOfCrop(int cropID){
		return queryForList("getMarketPricesOfCrop", cropID);
	}
	public List<MarketBean> getCropPricesOfMarket(int locID){
		return queryForList("getCropPricesOfMarket", locID);
	}
	public void updateCropPrice(MarketBean marketBean){
		int lid= (Integer)queryForObject("getLocIdFromMarketName", marketBean.getMarketName());
		marketBean.setLocId(lid);
		int cid=(Integer)queryForObject("getCropId", marketBean.getCropName());
		marketBean.setCropId(cid);
		update("updateCropPrice",marketBean);
	}
}

