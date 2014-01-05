package com.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.beans.InsBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.InsDao;

public class InsSqlMapDao extends BaseSqlMapDao implements InsDao{
	public static final String classNameToLog = InsDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public InsSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addIns(InsBean insBean){
		insert("addIns",insBean);
	}
	public void deleteIns(int insID){
		delete("deleteIns", insID);
	}
	public void updateIns(InsBean insBean){
		update("updateIns",insBean);
	}
	public List<InsBean> getAllInss(){
		return queryForList("getAllInss", null);
	}
	public List<String> getAllInsNames(){
		return queryForList("getAllInsNames", null);
	}
	public InsBean getInsDetails(int insID){
		return (InsBean)queryForObject("getInsDetails", insID);
	}
	public List<String> getAllTypes(){
		return queryForList("getAllTypes", null);
	}
	public List<Integer> getMyInss(int fid){
		return queryForList("getMyInss",fid);		
	}
	public List<Integer> getOtherInss(int fid){
		return queryForList("getOtherInss",fid);		
	}
	public void deleteOldIns(int insID,int fid){
		HashMap<String,Integer> myOldIns = new HashMap<String,Integer>();
		myOldIns.put("insID",insID);
		myOldIns.put("fid", fid);
		delete("deleteOldIns",myOldIns);
	}
	public void addNewIns(int insID,int fid){
		Map<String,Integer> insMap = new HashMap<String,Integer>();
		insMap.put("fid",fid);
		insMap.put("insID", insID);
		insert("addNewIns",insMap);
		update("addInsCount",insID);
	}
	public int getCropCount(){
		List<Integer> counts= queryForList("getCropCount",null);
		int total=0;
		Iterator<Integer> it=counts.iterator();
		while(it.hasNext()){
			total+=it.next();
		}
		return total;
	}
}
