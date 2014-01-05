package com.action;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.ToolBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ToolService;

public class ToolAction extends ActionSupport implements ServletRequestAware{
	public static final String classNameToLog = ToolAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private ToolBean toolBean = new ToolBean();
	private ToolService toolService = new ToolService();
	private HttpServletRequest req;
	
	private File upload;//The actual file
	private String uploadContentType; //The content type of the file
	private String uploadFileName; //The uploaded file name
	private String name,manufacturer;
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	public Object getTool(){
		return toolBean;
	}
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.req = httpServletRequest;
	}
	
	@SkipValidation
	public String addTool(){
		try {
			System.out.println("addTool");
			File f = new File("newFile.txt");
			f.createNewFile();		
			logger.debug("addTool");
			toolBean.setManufacturer(manufacturer);
			toolBean.setName(name);
			toolBean.setUpload(upload);
			toolBean.setUploadFileName(manufacturer+"-"+uploadFileName);
			String filePath = req.getRealPath("/");
			logger.debug("Server Path = "+filePath);
			String fullFileName = filePath+"Uploads\\"+manufacturer+"-"+getUploadFileName();
			logger.debug("FullFileName = "+fullFileName);
			File theFile = new File(fullFileName);
			theFile.createNewFile();
			FileUtils.copyFile(toolBean.getUpload(), theFile);
			toolService.addTool(toolBean);
			addActionMessage("Insertion successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while inserting tool information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String getAllTools(){
		try {
			toolBean.setAllTools(toolService.getAllTools());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving tool information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
	
	@SkipValidation
	public String deleteTool(){
		try {
			int tid = toolBean.getTID(); 
			String fileName = toolService.getFileName(tid);
			String filePath = req.getRealPath("/");
			String fullFileName = filePath+"Uploads\\"+fileName;
			logger.debug("Deleting file : "+fullFileName);
			File theFile = new File(fullFileName);
			logger.debug("isFile : "+theFile.isFile());
			logger.debug("File removed = "+theFile.delete());
			toolService.deleteTool(tid);
			addActionMessage("Deletion Successful");
			return getAllTools();
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving tool information.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
			}
	}
}
