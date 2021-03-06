package com.holyshit.Dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.holyshit.domain.PDocAudit;
import com.holyshit.domain.Projaprlaudit;

public interface AuditDao {
	/**
	 * 查到所有审核了的项目
	 * @param staffno 用户便哈
	 * @return
	 */
	List<Object> selectAuditedPro(String staffno);
	
	/**
	 * 插入理想审核信息
	 * @param paa 立项审核信息对象
	 * @throws SQLException
	 */
	void insertprojaprlaudit(Projaprlaudit paa) throws SQLException;
	
	/**
	 * 插入立项文档审核信息
	 * @param paa 立项审核信息对象
	 * @throws SQLException
	 */
	void insertpdocaudit(PDocAudit pda) throws SQLException;
	
	/**
	 * 审核界面项目相关信息
	 * @param mno 消息表主键
	 * @return
	 * @throws SQLException 
	 */
	Map<String,Object> selectProAuditInfo(String mno) throws SQLException;
	
	/**
	 * 项目审核意见相关
	 * @param mno
	 * @return
	 * @throws SQLException 
	 */
	List<Map<String,Object>> selectProAuditAdvInfo(String mno) throws SQLException;
	
	/**
	 * 更新立项审核表
	 * @param map
	 * @throws SQLException 
	 */
	void updateProAuditInfo(String mno,String auditstate,String auditadv,String NAuditorNo) throws SQLException;
	void updateProAuditInfo(String mno,String auditstate,String auditadv) throws SQLException;
	
	/**
	 * 根据消息表编号查找立项审核表信息
	 * @param mno
	 * @return
	 * @throws SQLException 
	 */
	Projaprlaudit selectPAAByMno(String mno) throws SQLException;
	
	/**
	 * 文档审核相关信息
	 * @param pdauditno
	 * @return
	 * @throws SQLException 
	 */
	Map<String,Object> selectDocAudit(String pdauditno) throws SQLException;
	
	/**
	 * 根据阶段表好获取阶段审核信息
	 * @param stageno
	 * @return
	 * @throws SQLException 
	 */
	Map<String,Object> selectStageAudit(String stageno) throws SQLException;
	
	/**
	 * 根据任务编号获取任务审核信息
	 * @param stageno
	 * @return
	 * @throws SQLException 
	 */
	Map<String,Object> selectTaskAudit(String taskno) throws SQLException;
}
