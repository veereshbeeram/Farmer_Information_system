package com.persistence.dao;

import java.util.List;
import com.beans.SoilBean;

public interface SoilDao {
	
	void addSoil(String name);
	void deleteSoil(String name);
	List<SoilBean> getAllSoils();
}
