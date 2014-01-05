package com.persistence.sqlmapdao;

import com.beans.LoginBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LoginDao;

public class LoginSqlMapDao extends BaseSqlMapDao implements LoginDao{
	
	public LoginSqlMapDao(DaoManager daoManager){
		super(daoManager);
	}
	
	public String verify(LoginBean loginBean)
	{
		int fid=-1;Object o;
		o = queryForObject("getFid", loginBean);
		if(o==null)
			return "input";
		else
			fid = (Integer)o;
		loginBean.setFid(fid);
		return (String)queryForObject("getOcc", fid);
	}
}




