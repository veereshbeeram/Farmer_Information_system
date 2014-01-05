package com.persistence.sqlmapdao;

import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import com.beans.PollBean;
import com.ibatis.dao.client.DaoManager;
import com.persistence.dao.PollDao;

public class PollSqlMapDao extends BaseSqlMapDao implements PollDao{
	public static final String classNameToLog = PollDao.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public PollSqlMapDao(DaoManager daoManager) {
		super(daoManager);
	}
	
	public void addPoll(PollBean pollBean){
		insert("addPoll", pollBean);
	}
	public List<PollBean> getAllPolls(){
		return queryForList("getAllPolls", null);
	}
	public void deletePoll(int pollID){
		delete("deletePoll",pollID);
	}
	public PollBean getPollResult(int pollID){
		PollBean pollBean=(PollBean)queryForObject("getPollResult", pollID);
		int total=pollBean.getCount1()+pollBean.getCount2()+pollBean.getCount3()+pollBean.getCount4();
		if(total==0)
			return pollBean;
		pollBean.setPercent1(100*(float)pollBean.getCount1()/total);
		pollBean.setPercent2(100*(float)pollBean.getCount2()/total);
		pollBean.setPercent3(100*(float)pollBean.getCount3()/total);
		pollBean.setPercent4(100*(float)pollBean.getCount4()/total);
		return pollBean;
	}
	public void registerVote(PollBean pollBean){
		List<PollBean> allPolls = pollBean.getAllPolls();
		PollBean curPollBean=null;String selectedOption=null;List<String> allOptions=null;
		int index=0;
		Iterator<PollBean> it = allPolls.iterator();
		while(it.hasNext()){
			curPollBean = it.next();
			allOptions = ((PollBean)queryForObject("getOptionsOfPoll", curPollBean.getPollID())).getOptions();
			if(curPollBean.getOptions().size()==0)
				continue;
			selectedOption = curPollBean.getOptions().get(0);
			index = allOptions.indexOf(selectedOption);
			curPollBean.incOptionCount(index);
			update("registerVote",curPollBean);
		}
	}
}
