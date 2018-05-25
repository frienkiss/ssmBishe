package com.ys.model;

import com.ys.model.Monitor;
public class Alert {
	private int alertId;
	private String User;
	private String monitor;
	private String SmsText;
	private String mobile;
	private String RecvTime;
	private String SendTime;
	private boolean status;
	public int getAlertId() {
		return alertId;
	}
	public void setAlertId(int alertId) {
		this.alertId = alertId;
	}
	public String getUser() {
		return User;
	}
	public void setUser(String user) {
		User = user;
	}
	public String getMonitor() {
		return monitor;
	}
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	public String getSmsText() {
		return SmsText;
	}
	public void setSmsText(String smsText) {
		SmsText = smsText;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getRecvTime() {
		return RecvTime;
	}
	public void setRecvTime(String recvTime) {
		RecvTime = recvTime;
	}
	public String getSendTime() {
		return SendTime;
	}
	public void setSendTime(String sendTime) {
		SendTime = sendTime;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	

}
