package com.listener;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.beans.ValuesBean;
import com.service.CropService;
import com.service.LocService;
	
public class MyServletContextListener implements ServletContextListener{
	
	private ValuesBean vb = new ValuesBean();
	public static final String classNameToLog = MyServletContextListener.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	
	public void contextInitialized(ServletContextEvent e) {
		logger.debug("Initializing application");
		ServletContext sc  = e.getServletContext();
		CropService cropService = new CropService();
		vb.setAllCropNames(cropService.getAllCropNames());
		LocService locService = new LocService();
		vb.setAllStateNames(locService.getAllStateNames());
		sc.setAttribute("appInitValues",vb);
		vb.setAllOccupations(new ArrayList<String>());
		vb.getAllOccupations().add("Farmer");
		vb.getAllOccupations().add("Student");
		vb.getAllOccupations().add("Other");
		}
	
	public void contextDestroyed(ServletContextEvent e) {
		System.out.println("App is going down");
	}
}

