package com.filter;
import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.beans.LoginBean;

public class FarmerAuthInt extends AbstractInterceptor
{
public String intercept(ActionInvocation ai) throws Exception
{
	Map session = ai.getInvocationContext().getSession();
	LoginBean lb = (LoginBean)session.get("user");
	if(lb==null || !(lb.getUserRole().equals("Farmer")))
	{
		Action myAction = (Action)ai.getAction();
		if(myAction instanceof ValidationAware)
			((ValidationAware)myAction).addActionError("<em><strong>Please do login before trying to access secure actions</strong></em>");
		return "INSECURE";
	}
	else 
		return ai.invoke();
}
}