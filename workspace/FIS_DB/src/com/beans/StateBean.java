package com.beans;
import java.util.ArrayList;
import java.util.List;

public class StateBean {
	
	private String name;
	private List<String> dis = new ArrayList<String>();
	public StateBean(String s)
	{
		name = s;
	}
	
	public String getName()
	{
		return name;
	}

	public void addDistrict(String d)
	{
		dis.add(d);
	}
	
	public List<String> getDistrictValues()
	{
		return dis;
	}
}
