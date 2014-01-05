package com.beans;

import java.util.List;

public class MarketBean {
	
	private String marketName,cropName;
	private int locId,cropId;
	private Float oldPrice,newPrice;
	private List<String> allMarketNames;
	private List<MarketBean> cropPrices;
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	public String getCropName() {
		return cropName;
	}
	public void setCropName(String cropName) {
		this.cropName = cropName;
	}
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public int getCropId() {
		return cropId;
	}
	public void setCropId(int cropId) {
		this.cropId = cropId;
	}
	public Float getOldPrice() {
		return oldPrice;
	}
	public void setOldPrice(Float oldPrice) {
		this.oldPrice = oldPrice;
	}
	public Float getNewPrice() {
		return newPrice;
	}
	public void setNewPrice(Float newPrice) {
		this.newPrice = newPrice;
	}
	public List<String> getAllMarketNames() {
		return allMarketNames;
	}
	public void setAllMarketNames(List<String> allMarketNames) {
		this.allMarketNames = allMarketNames;
	}
	public List<MarketBean> getCropPrices() {
		return cropPrices;
	}
	public void setCropPrices(List<MarketBean> cropPrices) {
		this.cropPrices = cropPrices;
	}
}
	