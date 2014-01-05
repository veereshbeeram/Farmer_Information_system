package com.persistence.dao;

import java.util.List;

import com.beans.PollBean;


public interface PollDao {
	
	void addPoll(PollBean pollBean);
	List<PollBean> getAllPolls();
	void deletePoll(int pollID);
	PollBean getPollResult(int pollID);
	void registerVote(PollBean pollBean);
}
