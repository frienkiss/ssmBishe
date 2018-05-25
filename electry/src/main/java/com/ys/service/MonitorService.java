package com.ys.service;
/**
 * 监测点
 * @author liushaobo
 *
 */

import java.util.List;
import com.ys.model.Monitor;
public interface MonitorService {
	public Monitor queryMonitorById(int seeId);
	public Monitor queryMonitorByName(String seeName);
	public List<Monitor> queryChildMonitor(int seeId);
	public List<Monitor> queryAllMonitor();
}
