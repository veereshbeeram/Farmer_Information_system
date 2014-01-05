package com.action;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.LoginBean;
import com.beans.QueryBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.QueryService;

public class QueryAction extends ActionSupport implements SessionAware{
	
	public static final String classNameToLog = QueryAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private QueryBean queryBean = new QueryBean();
	private QueryService queryService = new QueryService();
	private Map session;
	
	public void setSession(Map session) {
		this.session = session;
	}
	
	public Object getQuery()
	{
		return queryBean;
	}
	
	@SkipValidation
	public String getOffNames(){
		queryBean.setOffNames(queryService.getOffNames());
		return SUCCESS;
	}
	
	@SkipValidation
	public String postQuery()
	{
		try {
				int fid = ((LoginBean)session.get("user")).getFid();
				queryBean.setFid(fid);
				queryService.postQuery(queryBean);
				addActionMessage("Your Query was posted successfully");
				queryBean.setOffNames(queryService.getOffNames());
				return SUCCESS;	
			}	
		catch(Exception e){
				addActionError("There was a problem while inserting query information.Please Contact Admin");
				logger.error(e.getMessage(), e);
				return ERROR;
			}
	}
	
	@SkipValidation
	public String getQueryList(){
		try {
			int offId = ((LoginBean)session.get("user")).getFid();
			List<QueryBean> queryList = queryService.getQueryListFromOffId(offId); 
			if(queryList==null||queryList.size()==0)
				addActionMessage("No Queries for u!");
			else
				queryBean.setQueryList(queryList);
			return SUCCESS;	
		}	
		catch(Exception e){
			addActionError("There was a problem while retrieving query information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String addReply(){
		try {
			queryService.addReply(queryBean);
			return SUCCESS;	
		}	
		catch(Exception e){
			addActionError("There was a problem while inserting query information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	@SkipValidation
	public String getAllMyQueries(){
		try {
			int fid = ((LoginBean)session.get("user")).getFid();
			List<QueryBean> queryList = queryService.getQueryListFromFid(fid);
			if(queryList==null||queryList.size()==0)
				addActionMessage("No Queries from u!");
			else
				queryBean.setQueryList(queryList);
			return SUCCESS;	
		}	
		catch(Exception e){
			addActionError("There was a problem while retrieving query information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

}
	