package com.persistence.dao;

import java.util.List;

import com.beans.MarketBean;


public interface MarketDao {
	
	int getCropId(String cropName);
	int getLocId(String marketName);
	float getPriceOfCrop(MarketBean marketBean);
	void addCropPrice(MarketBean marketBean);
	List<String> getAllMarketNames();
	List<MarketBean> getAllCropPricesFromMarket(int locid);
	List<MarketBean> getMarketPricesOfCrop(int cropID);
	List<MarketBean> getCropPricesOfMarket(int locID);
	void updateCropPrice(MarketBean marketBean);
}
