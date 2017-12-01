package com.holyshit.service;

import java.sql.SQLException;
import java.util.List;

import com.holyshit.domain.StageTask;

public interface StageTasksService {
	/**
	 * 根据员工id，获取员工正在进行的所有任务
	 * @param id 员工id
	 * @return
	 */
	List<StageTask> findAllTasksByid(String id);
	
	/**
	 * 根据任务编号对已有的（空的）指标编号排序后返回
	 * @param tn
	 * @return
	 * @throws SQLException 
	 */
	List<Object> getNewIndexNo(String tn) throws SQLException;

}
