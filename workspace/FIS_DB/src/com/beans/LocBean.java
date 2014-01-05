package com.beans;

import java.util.List;

public class LocBean {
	private String state,district,marketName,oldFavCrop,newFavCrop;
	private Float avgTemp,rain;
	private List<LocBean> allLocs;
	private List<String> favCrops;
	private List<String> unFavCrops;
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	public Float getAvgTemp() {
		return avgTemp;
	}
	public void setAvgTemp(Float avgTemp) {
		this.avgTemp = avgTemp;
	}
	public Float getRain() {
		return rain;
	}
	public void setRain(Float rain) {
		this.rain = rain;
	}
	public List<LocBean> getAllLocs() {
		return allLocs;
	}
	public void setAllLocs(List<LocBean> allLocs) {
		this.allLocs = allLocs;
	}
	public List<String> getFavCrops() {
		return favCrops;
	}
	public void setFavCrops(List<String> favCrops) {
		this.favCrops = favCrops;
	}
	public String getOldFavCrop() {
		return oldFavCrop;
	}
	public void setOldFavCrop(String oldFavCrop) {
		this.oldFavCrop = oldFavCrop;
	}
	public List<String> getUnFavCrops() {
		return unFavCrops;
	}
	public void setUnFavCrops(List<String> unFavCrops) {
		this.unFavCrops = unFavCrops;
	}
	public String getNewFavCrop() {
		return newFavCrop;
	}
	public void setNewFavCrop(String newFavCrop) {
		this.newFavCrop = newFavCrop;
	}
}	
	