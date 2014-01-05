package com.beans;

import java.util.ArrayList;
import java.util.List;

public class PollBean {
	
	private String question,option1,option2,option3,option4;
	private int count1,count2,count3,count4,pollID;
	private List<PollBean> allPolls;
	private List<String> options = new ArrayList<String>();
	private float percent1,percent2,percent3,percent4;
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public List<PollBean> getAllPolls() {
		return allPolls;
	}
	public void setAllPolls(List<PollBean> allPolls) {
		this.allPolls = allPolls;
	}
	public int getPollID() {
		return pollID;
	}
	public void setPollID(int pollID) {
		this.pollID = pollID;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public void setOption1(String option1) {
		options.add(option1);
		this.option1=option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		options.add(option2);
		this.option2=option2;
	}
	public String getOption3() {
		return option3;
		
	}
	public void setOption3(String option3) {
		options.add(option3);
		this.option3=option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		options.add(option4);
		this.option4=option4;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
	public int getCount2() {
		return count2;
	}
	public void setCount2(int count2) {
		this.count2 = count2;
	}
	public int getCount3() {
		return count3;
	}
	public void setCount3(int count3) {
		this.count3 = count3;
	}
	public int getCount4() {
		return count4;
	}
	public void setCount4(int count4) {
		this.count4 = count4;
	}
	public float getPercent1() {
		return percent1;
	}
	public void setPercent1(float percent1) {
		this.percent1 = percent1;
	}
	public float getPercent2() {
		return percent2;
	}
	public void setPercent2(float percent2) {
		this.percent2 = percent2;
	}
	public float getPercent3() {
		return percent3;
	}
	public void setPercent3(float percent3) {
		this.percent3 = percent3;
	}
	public float getPercent4() {
		return percent4;
	}
	public void setPercent4(float percent4) {
		this.percent4 = percent4;
	}
	public void incOptionCount(int index){
		switch(index){
		case 0 : count1++;
				 break;
		case 1 : count2++;
				 break;
		case 2 : count3++;
				 break;
		default : count4++;
				  break;
		}
	}
}
