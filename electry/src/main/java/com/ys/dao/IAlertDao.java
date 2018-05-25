package com.ys.dao;
/**
 * @author liushaobo
 */
import java.util.List;
import com.ys.model.Alert;

import org.apache.ibatis.annotations.Param;
public interface IAlertDao {
	public List<Alert> queryAlertInfo(int startNum);
	public List<Integer> queryCount();
	public void delRow(int alertId);
}
