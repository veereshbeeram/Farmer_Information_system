package com.action;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.PollBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.PollService;

public class PollAction extends ActionSupport implements SessionAware{

	private PollBean pollBean = new PollBean();
	private PollService pollService = new PollService();
	public static final String classNameToLog = PollAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private Map session;
	
	public PollBean getPoll()   
	{
		return pollBean;
	}

	public void setSession(Map session) 
	{
		this.session = session;
	}
	
	public String addPoll()
	{
		try {
			pollService.addPoll(pollBean);
			pollBean = null;		//serves as reset
			addActionMessage("Insertion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting poll information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}

	@SkipValidation
	public String getAllPolls(){
		try {
			pollBean.setAllPolls(pollService.getAllPolls());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving poll information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}

	@SkipValidation
	public String deletePoll(){
		try {
			pollService.deletePoll(pollBean.getPollID());
			pollBean.setAllPolls(pollService.getAllPolls());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while deleting poll information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String getPollResult(){
		try {
		      pollBean = pollService.getPollResult(pollBean.getPollID());
			  return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving poll result.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String registerVote(){
		try {
		     logger.debug("registerVote");
		     pollService.registerVote(pollBean);
		     addActionMessage("Your Vote has been registered successfully");
		     return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting poll vote.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
}
