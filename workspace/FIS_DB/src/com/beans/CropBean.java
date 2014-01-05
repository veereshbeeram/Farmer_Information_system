package com.beans;
import java.util.List;

public class CropBean {
	private String type,name,season,newFavFert,oldFavFert,newFavSoil,oldFavSoil;
	private int cid;
	private List<String> myCropNames,otherCropNames,allCropNames,favFerts,unfavFerts,favSoils,unfavSoils;
	private List<FertBean> allFertilisers;
	private List<CropBean> myCrops,allCrops;
	private List<Integer> fertIDs,soilIDs;
	private List<SoilBean> allSoils;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getMyCropNames() {
		return myCropNames;
	}
	public void setMyCropNames(List<String> myCropNames) {
		this.myCropNames = myCropNames;
	}
	public List<CropBean> getMyCrops() {
		return myCrops;
	}
	public void setMyCrops(List<CropBean> myCrops) {
		this.myCrops = myCrops;
	}
	public List<String> getOtherCropNames() {
		return otherCropNames;
	}
	public void setOtherCropNames(List<String> otherCropNames) {
		this.otherCropNames = otherCropNames;
	}
	public List<String> getAllCropNames() {
		return allCropNames;
	}
	public void setAllCropNames(List<String> allCropNames) {
		this.allCropNames = allCropNames;
	}
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CropBean other = (CropBean) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	public List<CropBean> getAllCrops() {
		return allCrops;
	}
	public void setAllCrops(List<CropBean> allCrops) {
		this.allCrops = allCrops;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public List<FertBean> getAllFertilisers() {
		return allFertilisers;
	}
	public void setAllFertilisers(List<FertBean> allFertilisers) {
		this.allFertilisers = allFertilisers;
	}
	public List<Integer> getFertIDs() {
		return fertIDs;
	}
	public void setFertIDs(List<Integer> fertIDs) {
		this.fertIDs = fertIDs;
	}
	public List<SoilBean> getAllSoils() {
		return allSoils;
	}
	public void setAllSoils(List<SoilBean> allSoils) {
		this.allSoils = allSoils;
	}
	public List<Integer> getSoilIDs() {
		return soilIDs;
	}
	public void setSoilIDs(List<Integer> soilIDs) {
		this.soilIDs = soilIDs;
	}
	public void reset(){
		name=null;
		type=null;
		season=null;
		fertIDs=null;
		soilIDs=null;
	}
	public List<String> getFavFerts() {
		return favFerts;
	}
	public void setFavFerts(List<String> favFerts) {
		this.favFerts = favFerts;
	}
	public List<String> getUnfavFerts() {
		return unfavFerts;
	}
	public void setUnfavFerts(List<String> unfavFerts) {
		this.unfavFerts = unfavFerts;
	}
	public String getNewFavFert() {
		return newFavFert;
	}
	public void setNewFavFert(String newFavFert) {
		this.newFavFert = newFavFert;
	}
	public String getOldFavFert() {
		return oldFavFert;
	}
	public void setOldFavFert(String oldFavFert) {
		this.oldFavFert = oldFavFert;
	}
	public String getNewFavSoil() {
		return newFavSoil;
	}
	public void setNewFavSoil(String newFavSoil) {
		this.newFavSoil = newFavSoil;
	}
	public String getOldFavSoil() {
		return oldFavSoil;
	}
	public void setOldFavSoil(String oldFavSoil) {
		this.oldFavSoil = oldFavSoil;
	}
	public List<String> getFavSoils() {
		return favSoils;
	}
	public void setFavSoils(List<String> favSoils) {
		this.favSoils = favSoils;
	}
	public List<String> getUnfavSoils() {
		return unfavSoils;
	}
	public void setUnfavSoils(List<String> unfavSoils) {
		this.unfavSoils = unfavSoils;
	}
	
}

	
