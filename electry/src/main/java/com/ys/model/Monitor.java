package com.ys.model;

public class Monitor {
	private int seeId;
	private int upSeeId;
	private String seeName;
	private String upSeeName;
	
	public int getSeeId() {
		return seeId;
	}
	public int getUpSeeId() {
		return upSeeId;
	}
	public String getSeeName() {
		return seeName;
	}
	public String getUpSeeName() {
		return upSeeName;
	}
	
	public void setSeeId(int seeId) {
		this.seeId=seeId;
	}
	public void setUpSeeId(int upSeeId) {
		this.upSeeId=upSeeId;
	}
	public void setSeeName(String seeName) {
		this.seeName=seeName;
	}
	public void setUpSeeName(String upSeeName) {
		this.upSeeName=upSeeName;
	}
}
