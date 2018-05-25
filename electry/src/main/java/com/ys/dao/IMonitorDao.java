package com.ys.dao;
/**
 * @author liushaobo
 */
import java.util.List;

import com.ys.model.Monitor;
public interface IMonitorDao {
   public Monitor queryMonitorById(int seeId);
   public Monitor queryMonitorById2(int seeId);
   public Monitor queryMonitorByName(String seeName);
   public List<Monitor> queryChildrenMonitor(int upseeId);
   public List<Monitor> queryAllMonitor();
   
}
