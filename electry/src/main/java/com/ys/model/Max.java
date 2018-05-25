package com.ys.model;
/**
 * 最值类
 * @author liushaobo
 *
 */
public class Max {
	private String  seename;
	private String MDATE;
	private double MMAX;
	private String startTime;
	private int pvalue;
	private int  pvalueMonSub;
	private String PDATE;
	private double MMIN;
	private String endTime;
	
	public String getSeeName() {
		return seename;
	}
	public String getMDATE() {
		return MDATE;
	}
	public String getPDATE() {
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
	public int getPvalue() {
		return pvalue;
	}
	public int getPvalueMonSub() {
		return pvalueMonSub;
	}
	
	public void setSeeName(String seeName) {
		this.seename=seeName;
	}
	public void setMDATE(String MDATE) {
		this.MDATE=MDATE;
	}
	public void setPDATE(String PDATE) {
		this.PDATE=PDATE;
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
