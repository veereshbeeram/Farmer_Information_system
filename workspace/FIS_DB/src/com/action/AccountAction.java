package com.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.beans.LoginBean;
import com.beans.RegisterBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.RegisterService;

public class AccountAction extends ActionSupport implements ServletRequestAware,SessionAware{
	private HttpServletRequest req;
	public static final String classNameToLog = AccountAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private Map session;
	private RegisterService registerService = new RegisterService();
	private RegisterBean registerBean = new RegisterBean();
	
	public void setServletRequest(HttpServletRequest r) {
		req = r;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public Object getReg()	{
		return registerBean;
	}
	
	public String getUserDetails(){
		int fid = ((LoginBean)session.get("user")).getFid();
		try{
		registerBean = registerService.getUserDetails(fid);
		return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving account info.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	public String logout()
	{
		HttpSession session = req.getSession(false);
		logger.debug("invalidating session "+session);
		if(session!=null)
			session.invalidate();
		return SUCCESS;
	}
	
	public String getUser(){
		if(session.isEmpty())
			return "none";
		return ((LoginBean)session.get("user")).getUserRole();
	}
}
