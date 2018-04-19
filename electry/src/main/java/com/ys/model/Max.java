package com.ys.model;
/**
 * 最值类
 * @author liushaobo
 *
 */
public class Max {
	private int TID;
	private String MDATE;
	private double MMAX;
	private String startTime;

	private double MMIN;
	private String endTime;
	
	public int getTID() {
		return TID;
	}
	public String getMDATE() {
		return MDATE;
	}
	public double getMMAX() {
		return MMAX;
	}
	
	public String getStartTime() {
		return startTime;
	}
	public double getMMIN() {
		return MMIN;
	}

	public String getEndTime() {
		return endTime;
	}
	public void setTID(int TID) {
		this.TID=TID;
	}
	public void setMDATE(String MDATE) {
		this.MDATE=MDATE;
	}
	public void setMMAX(double MMAX) {
		this.MMAX=MMAX;
	}
	public void setStartTime(String startTime) {
		this.startTime=startTime;
	}
	public void setMMIN(double MMIN) {
		this.MMIN=MMIN;
	}
	public void setEndTime(String endTime) {
		this.endTime=endTime;
	}
}
