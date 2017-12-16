package com.holyshit.Dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.holyshit.domain.PSRelation;
import com.holyshit.domain.Staff;
import com.holyshit.domain.StaffDuty;

public interface StaffDao {
	/**
	 * ����Ա��id��ѯԱ������Ϣ
	 * @param id Ա��id
	 * @return  Ա������Ϣ
	 * @throws SQLException
	 */
	Staff selectStaffById(String id)throws SQLException;
	/**
	 * ������ĵ����Ǹ���ɶ��������
	 */
	
	/**
	 * 通过输入的用户姓名获取到staffname和staffno
	 * @param msg 输入文本信息
	 * @return
	 * @throws Exception
	 */
	List<Staff> selectNameNoByname(String msg)throws Exception;
	/**
	 * 获取员工信息以及职责
	 * @param pno
	 * @return
	 * @throws SQLException
	 */
	List<StaffDuty> findAllStaffs(String pno,int CurrentPage,int PageSize) throws SQLException;
	/**
	 * 删除某个项目的所有成员
	 * @param staffnos  成员id数组
	 * @param pno  项目id
	 * @throws SQLException
	 */
	void delAllStaffs(String[] staffnos,String pno) throws SQLException;
	
	void addAStaff(PSRelation psr) throws SQLException;
	
	/**
	 * 
	 * @param no 编号
	 * @return
	 * @throws SQLException 
	 */
	int selectStaffByNo(String no) throws SQLException;
	int countAllStaffs(String pno) throws SQLException;
	
	/**
	 * 从项目组里面拉人
	 * @param pno 项目编号
	 * @param userno 用户编号
	 * @return 返回项目组人员名单，暂且不排除发布人自己当审核人的情况
	 * @throws SQLException 
	 */
	List<Map<String,Object>> selectStaffInProject(String pno,String userno) throws SQLException;
	
	/**
	 * 从公司里面拉人
	 * @param pno 项目编号
	 * @param userno 用户编号
	 * @return 
	 * @throws SQLException 
	 */
	List<Map<String,Object>> selectStaffInCompany(String pno,String userno) throws SQLException;
}   
 