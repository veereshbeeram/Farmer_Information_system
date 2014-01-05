package com.beans;

public class CropLocBean {
	
	private String cropName,type,season,state,district,marketName;
	private Float rainfall,avgTemp;
	public String getCropName() {
		return cropName;
	}
	public void setCropName(String cropName) {
		this.cropName = cropName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
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
	public Float getRainfall() {
		return rainfall;
	}
	public void setRainfall(Float rainfall) {
		this.rainfall = rainfall;
	}
	public Float getAvgTemp() {
		return avgTemp;
	}
	public void setAvgTemp(Float avgTemp) {
		this.avgTemp = avgTemp;
	}
	
}
