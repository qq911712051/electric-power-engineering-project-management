package com.holyshit.service;

import java.util.Map;

import com.holyshit.domain.Inform;
import com.holyshit.domain.PDocAudit;
import com.holyshit.domain.Projaprlaudit;

public interface AuditService {
	/**
	 * 立项时发送增加审核信息
	 * @param paa
	 */
	void addProAuditInfo(Projaprlaudit paa);
	
	/**
	 * 立项时增加项目文档审核信息
	 * @param paa
	 */
	void addPdocauditInfo(PDocAudit pda);
	
	/**
	 * 得到项目审核相关信息
	 * @param mno
	 * @return
	 */
	String getProAuditInfo(String mno);
	
	/**
	 * 得到项目审核整个javabean类，多是编号类后台数据，和getProAuditInfo不同
	 * @param mno
	 * @return
	 */
	Projaprlaudit getPAAInfoByMno(String mno);
	
	/**
	 * 改变项目审核表信息
	 * @param mno
	 * @param auditstate
	 * @param auditadv
	 * @param NAuditorNo
	 */
	void changePAAInfo(String mno, String auditstate,String auditadv, String NAuditorNo);
	void changePAAInfo(String mno, String auditstate,String auditadv);
	/**
	 * 展示文档审核文档相关信息
	 * @param pdauditno
	 * @return
	 */
	Map<String,Object> getDocAuditInfo(String pdauditno);
	
	/**
	 * 改变文档审核状态，文档审核表和文档表
	 * @param adv
	 * @param auditstate
	 * @param dno
	 */
	void changeDocAuditState(String adv,String auditstate,String dno);
	
	/**
	 * 根据任务或者阶段编号获取指标审核内容
	 * @param taskno
	 * @return
	 */
	Map<String,Object> getIndexAudit(String taskno);
	
	/**
	 * 改变指标表状态和更新信息表h和任务状态
	 * @param info
	 * @param str
	 */
	int StageIndexAudit(Inform info,String [] str,String sno,String sstate);
	
	/**
	 * 获得指标路径
	 * @param indexno
	 * @return
	 */
	String getIndexPath(String indexno);
}
