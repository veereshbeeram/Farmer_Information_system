package com.persistence.sqlmapdao;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.beans.DependantBean;
import com.beans.RegisterBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.RegisterDao;

public class RegisterSqlMapDao extends BaseSqlMapDao implements RegisterDao{
	public RegisterSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}

	public List<String> getDistrictsInState(String stateName){
		return queryForList("getDistrictsInState",stateName);
	}
	
	public void register(RegisterBean registerBean){
		int i=0,fid,cid,locId;
		try{
		daoManager.startTransaction();
		locId = (Integer)queryForObject("getLocId", registerBean);
		registerBean.setLocId(locId);
		insert("storePerDetails",registerBean);
		fid = (Integer)queryForObject("getFidFromUid", registerBean.getUid());
		while(i<=1){
		DependantBean dep = registerBean.getDependant().get(i);
		if(dep.getName().equals(""))
		break;
		dep.setFid(fid);
		insert("storeDepDetails",dep);
		i++;
		}
		if(registerBean.getMyCrops()==null || registerBean.getMyCrops().size()==0)
		{
			daoManager.commitTransaction();
			return;
		}
		HashMap<String,Integer> myCrops = new HashMap<String, Integer>();
		myCrops.put("fid", fid);
		Iterator<String> it = registerBean.getMyCrops().iterator();
		while(it.hasNext()){
			cid = (Integer)queryForObject("getCropIdFromName",it.next());
			myCrops.put("cid", cid);
			insert("storeCropDetails",myCrops);
		}
		daoManager.commitTransaction();
		}
		finally{
			daoManager.endTransaction();
		}
	}
	
	public String checkUid(String uid){
		return (String)queryForObject("checkUid", uid);
	}
	
	public RegisterBean getUserDetails(int fid){
		RegisterBean registerBean = (RegisterBean)queryForObject("getPerDetails",fid);
		List<DependantBean> dependants = queryForList("getDepDetails", fid);
		registerBean.setDependant(dependants);
		Map<String,String> locMap = (Map)queryForObject("getLocDetailsFromId", registerBean.getLocId());
		registerBean.setState(locMap.get("state"));
		registerBean.setDistrict(locMap.get("district"));
		return registerBean;
	}

	public void updateProfile(RegisterBean registerBean){
		int i=0,fid=registerBean.getFid();
		List<DependantBean> allDependants = queryForList("getDepDetails", fid);
		if(allDependants.size()==0){
			while(i<=1){
				DependantBean dep = registerBean.getDependant().get(i);
				if(dep.getName().equals(""))
				break;
				dep.setFid(fid);
				insert("storeDepDetails",dep);
				i++;
				}
				if(registerBean.getMyCrops()==null || registerBean.getMyCrops().size()==0)
				{
					daoManager.commitTransaction();
					return;
				}
		}
		else if(allDependants.size()==1){
				DependantBean dep = registerBean.getDependant().get(0); 
				dep.setOldName(allDependants.get(0).getName());
				update("updateProfileDep",dep);
				insert("storeDepDetails",registerBean.getDependant().get(1));
			}
		else{
			i=0;
			Iterator<DependantBean> it = allDependants.iterator();	//from DB
			while(it.hasNext())
			{
				DependantBean dep = it.next();
				String oldName = dep.getName();
				DependantBean dep1 = registerBean.getDependant().get(i); 
				dep1.setOldName(oldName);
				update("updateProfileDep",dep1);
				i++;
			}
		}
	}
	
	public void addOfficer(RegisterBean registerBean){
		insert("addOfficer",registerBean);
	}
	public void deleteOff(String uid){
		delete("deleteOff",uid);
	}
	public List<String> getOffUidList(){
		return queryForList("getOffUidList", null);
	}
}

