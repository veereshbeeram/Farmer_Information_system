package com.service;

import com.beans.LoginBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.LoginDao;
import com.persistence.sqlmapdao.DaoConfig;

public class LoginService {
	
	private LoginDao loginDao;
	public LoginService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.loginDao = (LoginDao) daoMgr.getDao(LoginDao.class);
	}
	
	public String verify(LoginBean loginBean){
		return loginDao.verify(loginBean);
	}
}
