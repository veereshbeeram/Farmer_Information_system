package com.service;

import java.util.List;

import com.beans.MarketBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.MarketDao;
import com.persistence.sqlmapdao.DaoConfig;

public class MarketService {
	
	private MarketDao marketDao;
	public MarketService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
		this.marketDao = (MarketDao)daoMgr.getDao(MarketDao.class);
	}
	
	public int getCropId(String cropName){
		return marketDao.getCropId(cropName);
	}
	public int getLocId(String marketName){
		return marketDao.getLocId(marketName);
	}
	public float getPriceOfCrop(MarketBean marketBean){
		return marketDao.getPriceOfCrop(marketBean);
	}
	public List<String> getAllMarketNames(){
		return marketDao.getAllMarketNames();
	}
	public void addCropPrice(MarketBean marketBean){
		marketDao.addCropPrice(marketBean);
	}
	public List<MarketBean> getAllCropPricesFromMarket(int locid){	//not being used
		return marketDao.getAllCropPricesFromMarket(locid);
	}
	public List<MarketBean> getMarketPricesOfCrop(int cropID){
		return marketDao.getMarketPricesOfCrop(cropID);
	}
	public List<MarketBean> getCropPricesOfMarket(int locID){
		return marketDao.getCropPricesOfMarket(locID);
	}
	public void updateCropPrice(MarketBean marketBean){
		marketDao.updateCropPrice(marketBean);
	}
}
