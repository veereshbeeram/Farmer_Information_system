package com.beans;

import java.util.List;

public class FertBean {
	private String distributor;
	private Float price;
	private String description;
	private List<FertBean> allFerts;
	private Integer feID;
	
	public String getDistributor() {
		return distributor;
	}
	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public List<FertBean> getAllFerts() {
		return allFerts;
	}
	public void setAllFerts(List<FertBean> allFerts) {
		this.allFerts = allFerts;
	}
	public Integer getFeID() {
		return feID;
	}
	public void setFeID(Integer feID) {
		this.feID = feID;
	}
}
