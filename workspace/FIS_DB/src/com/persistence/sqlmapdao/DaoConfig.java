package com.persistence.sqlmapdao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.DaoManagerBuilder;

public class DaoConfig {

  private static final String resource = "persistenceConfig/daoConfig.xml";
  private static final DaoManager daoManager;
  
  static {
	  try {
		  Reader reader = Resources.getResourceAsReader(resource);
		  daoManager = DaoManagerBuilder.buildDaoManager(reader);   
	  }catch (Exception e) {
		  throw new RuntimeException("Could not initialize DaoConfig.  Cause: " + e, e);
      }
  	}

  public static DaoManager getDaoManager() {
    return daoManager;
  }
}



