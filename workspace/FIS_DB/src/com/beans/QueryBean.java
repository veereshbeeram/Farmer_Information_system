package com.beans;

import java.util.List;

public class QueryBean {

	private String ans,queryText,offName;
	private int fid,qid,offId;
	private List<String> offNames;
	private List<QueryBean> queryList;
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
		if(ans.equals(""))ans = null;
	}
	public String getOffName() {
		return offName;
	}
	public void setOffName(String offName) {
		this.offName = offName;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public List<String> getOffNames() {
		return offNames;
	}
	public void setOffNames(List<String> offNames) {
		this.offNames = offNames;
	}
	public int getOffId() {
		return offId;
	}
	public void setOffId(int offId) {
		this.offId = offId;
	}
	public List<QueryBean> getQueryList() {
		return queryList;
	}
	public void setQueryList(List<QueryBean> queryList) {
		this.queryList = queryList;
	}
	public String getQueryText() {
		return queryText;
	}
	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}
}
