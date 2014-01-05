package com.persistence.dao;

import java.util.List;

import com.beans.ToolBean;

public interface ToolDao {
	
	void addTool(ToolBean toolBean);
	List<ToolBean> getAllTools();
	void deleteTool(int tID);
	String getFileName(int tID);
}
