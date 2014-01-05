package com.service;

import java.util.List;

import com.beans.PollBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.PollDao;
import com.persistence.sqlmapdao.DaoConfig;

public class PollService {
	
	private PollDao pollDao;
	public PollService(){
		DaoManager daoMgr = DaoConfig.getDaoManager();
	    this.pollDao = (PollDao) daoMgr.getDao(PollDao.class);
	}
	
	public void addPoll(PollBean pollBean){
		pollDao.addPoll(pollBean);
	}
	public List<PollBean> getAllPolls(){
		return pollDao.getAllPolls();
	}
	public void deletePoll(int pollID){
		pollDao.deletePoll(pollID);
	}
	public PollBean getPollResult(int pollID){
		return pollDao.getPollResult(pollID);
	}
	public void registerVote(PollBean pollBean){
		pollDao.registerVote(pollBean);
	}
}