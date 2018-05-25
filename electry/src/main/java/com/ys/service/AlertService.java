package com.ys.service;

import com.ys.model.Alert;
import java.util.List;
public interface AlertService {
	public List<Alert> queryAlertInfo(int startNum);
	public List<Integer> queryCount();
	public void delRow(int alertId);
}
