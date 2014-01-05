package com.beans;

import java.io.File;
import java.util.List;

public class ToolBean {
	private File upload;//The actual file
	private String uploadContentType; //The content type of the file
	private String uploadFileName; //The uploaded file name
	private String name,manufacturer;
	private List<ToolBean> allTools;
	private String link;
	private Integer tID;
	
	
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
		System.out.println("setName : ToolBean");
		this.name = name;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public List<ToolBean> getAllTools() {
		return allTools;
	}
	public void setAllTools(List<ToolBean> allTools) {
		this.allTools = allTools;
	}
	public String getLink() {
		link = "Uploads/"+getUploadFileName();
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Integer getTID() {
		return tID;
	}
	public void setTID(Integer tid) {
		tID = tid;
	}
}
