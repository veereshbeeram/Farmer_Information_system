package com.beans;

import java.util.List;

public class LoanBean {
	private String name;
	private Float amount;
	private String income;
	private Float term;
	private Float interest;
	private Integer count;
	private List<LoanBean> allLoans;
	private List<Integer> myLoans;
	private Integer lid;
	private List<Integer> otherLoans;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public Float getTerm() {
		return term;
	}
	public void setTerm(Float term) {
		this.term = term;
	}
	public Float getInterest() {
		return interest;
	}
	public void setInterest(Float interest) {
		this.interest = interest;
	}
	public List<LoanBean> getAllLoans() {
		return allLoans;
	}
	public void setAllLoans(List<LoanBean> allLoans) {
		this.allLoans = allLoans;
	}
	public List<Integer> getMyLoans() {
		return myLoans;
	}
	public void setMyLoans(List<Integer> myLoans) {
		this.myLoans = myLoans;
	}
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public List<Integer> getOtherLoans() {
		return otherLoans;
	}
	public void setOtherLoans(List<Integer> otherLoans) {
		this.otherLoans = otherLoans;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
	