package com.beans;
import java.util.List;

public class ValuesBean{
	private List<String> allCropNames,allStateNames,allOccupations;
	
	public List<String> getAllCropNames() {
		return allCropNames;
	}

	public void setAllCropNames(List<String> allCropNames) {
		this.allCropNames = allCropNames;
	}

	public List<String> getAllStateNames() {
		return allStateNames;
	}

	public void setAllStateNames(List<String> allStateNames) {
		this.allStateNames = allStateNames;
	}

	public List<String> getAllOccupations() {
		return allOccupations;
	}

	public void setAllOccupations(List<String> allOccupations) {
		this.allOccupations = allOccupations;
	}
}
	