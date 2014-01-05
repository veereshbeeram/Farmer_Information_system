package com.action;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.beans.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.LoginService;

public class LoginAction extends ActionSupport implements SessionAware{

	private LoginBean loginBean = new LoginBean();
	private Map session;
	private String res;
	private LoginService loginService = new LoginService();
	public static final String classNameToLog = LoginAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public LoginBean getUser()   
	{
		return loginBean;
	}

	public void setSession(Map session) 
	{
		this.session = session;
	}
	
	public String doLogin()
	{
		logger.debug("inside doLogin : adding user to session");
		session.put("user",loginBean);
		return res;
	}

	public void validate()
	{
		try{
		logger.debug("inside validate");
		if(hasErrors())
			return;
		res = loginService.verify(loginBean);
		if(res.equals(INPUT))
			addActionError("Entered Username or Password is incorrect");
		else
			loginBean.setUserRole(res);
		}
		catch(Exception e){
			addActionError("There was a problem while trying to login.Please Contact Admin");
			logger.error(e.getMessage(), e);
		}
		}
}
