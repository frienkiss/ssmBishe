package com.ys.model;

/**
 * 监测点类
 * @author liushaobo
 *
 */
import java.util.List;

public class Monitor {
	private static final Monitor Monitor = null;
	private int seeId;
	private int upSeeId;
	private String seeName;
	private String upSeeName;
	private List<Monitor> children;
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
	public int getUpSeeId(int seeId) {
		return upSeeId;
	}
	public List<Monitor> getChildren(){
		return children;
	}
	public String getUpSeeName(String seeName) {
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
	@Override
	public String toString() {
		return "[seeId=" + seeId + ", upSeeId=" + upSeeId + ", seeName=" + seeName + ", upSeeName=" + upSeeName
				+ "]";
	}
	
}
