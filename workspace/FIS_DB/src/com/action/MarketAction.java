package com.action;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import com.beans.MarketBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.MarketService;

public class MarketAction extends ActionSupport implements SessionAware{
	public static final String classNameToLog = MarketAction.class.getName();
	public static final Logger logger = Logger.getLogger(classNameToLog);
	private MarketBean marketBean = new MarketBean();
	private MarketService marketService = new MarketService();
	private Map session;
	private Float cropPrice;
	private List<MarketBean> cropPrices;
	private List<MarketBean> marketPrices;
	
	public void setSession(Map session) {
		this.session = session;
	}
	
	public float getCropPrice() {
		return cropPrice;
	}

	public void setCropPrice(float cropPrice) {
		this.cropPrice = cropPrice;
	}
	
	public Object getMarket(){
		return marketBean;
	}
	
	@SkipValidation
	public String prepare(){
		try {
			marketBean.setAllMarketNames(marketService.getAllMarketNames());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while preparing for update.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	@SkipValidation
	public String getPriceOfCrop(){
		try {
			if(marketBean.getCropName()!=null)
				session.put("cropName", marketBean.getCropName());
			if(marketBean.getMarketName()!=null)
				session.put("marketName", marketBean.getMarketName());
			if(session.size()<=1)
				return SUCCESS;
			String marketName = (String)session.get("marketName");
			String cropName = (String)session.get("cropName"); 
			marketBean.setCropId(marketService.getCropId(cropName));
			marketBean.setLocId(marketService.getLocId(marketName));
			cropPrice = marketService.getPriceOfCrop(marketBean);
			session.remove("cropName");
			session.remove("marketName");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop price .Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getMarketPricesOfCrop(){
		try {
			int cropID = marketService.getCropId(marketBean.getCropName());
			marketBean.setCropPrices(marketService.getMarketPricesOfCrop(cropID));
			marketPrices = marketBean.getCropPrices();
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop prices.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
	@SkipValidation
	public String getCropPricesOfMarket(){
		try {
			int locID = marketService.getLocId(marketBean.getMarketName());
			marketBean.setCropPrices(marketService.getCropPricesOfMarket(locID));
			cropPrices = marketBean.getCropPrices();
			cropPrices.get(0).setMarketName(marketBean.getMarketName());
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop prices.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public List<MarketBean> getCropPrices() {
		return cropPrices;
	}

	public void setCropPrices(List<MarketBean> cropPrices) {
		this.cropPrices = cropPrices;
	}

	public List<MarketBean> getMarketPrices() {
		return marketPrices;
	}

	public void setMarketPrices(List<MarketBean> marketPrices) {
		this.marketPrices = marketPrices;
	}
	public String updateCropPrice(){
		try {
			logger.debug("updateCropPrice");
			marketService.updateCropPrice(marketBean);
			marketBean.setAllMarketNames(marketService.getAllMarketNames());
			addActionMessage("Crop Price Updation Successful");
			return SUCCESS;
		}
		catch(Exception e){
			addActionError("There was a problem while retrieving crop prices.Please Contact Admin");
			logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
	
}