package com.holyshit.service.impl;

import java.sql.SQLException;

import com.holyshit.Dao.AccountDao;
import com.holyshit.Dao.StaffDao;
import com.holyshit.Dao.impl.AccountDaoImpl;
import com.holyshit.Dao.impl.StaffDaoImpl;
import com.holyshit.domain.Account;
import com.holyshit.domain.Staff;
import com.holyshit.service.AccountService;
import com.holyshit.utils.ConnectionManager;

public class AccountServiceImpl implements AccountService {
<<<<<<< HEAD
	//Account表操作接口
	private AccountDao ad=new AccountDaoImpl();
	//Staff表操作接口
	private StaffDao sd=new StaffDaoImpl();
	@Override
	public boolean login(Account account) {
		// TODO Auto-generated method stub
		Account res=null;
		try {
			//开启一个事务，登陆时设置最后登陆时间
			ConnectionManager.startTransaction();
			res = ad.selectAccountById(account.getStaffno());
			ad.updateLltime(account);
			ConnectionManager.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ConnectionManager.rollback();
			e.printStackTrace();
			return false;
		}finally{
			ConnectionManager.closeConnection();
		}
		if(res==null){
			return false;
		}else {
			if(res.getPassword().equals(account.getPassword())){
				return true;
			}
		}
		
		return false;
	}
	@Override
	public String getUserLogoLinkById(String id) {
		// TODO Auto-generated method stub
		Staff staff=null;
		try {
			staff = sd.selectStaffById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(staff==null){
			return "user_not_found";
		}
		return staff.getImagelink();
=======
	//Account锟斤拷锟斤拷锟斤拷涌锟�
	private AccountDao ad=new AccountDaoImpl();
	//Staff锟斤拷锟斤拷锟斤拷涌锟�
	private StaffDao sd=new StaffDaoImpl();
	@Override
	public boolean login(Account account) {
		// TODO Auto-generated method stub
		Account res=null;
		try {
			//锟斤拷锟斤拷一锟斤拷锟斤拷锟今，碉拷陆时锟斤拷锟斤拷锟斤拷锟斤拷陆时锟斤拷
			ConnectionManager.startTransaction();
			res = ad.selectAccountById(account.getStaffno());
			ad.updateLltime(account);
			ConnectionManager.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ConnectionManager.rollback();
			e.printStackTrace();
			return false;
		}finally{
			ConnectionManager.closeConnection();
		}
		if(res==null){
			return false;
		}else {
			if(res.getPassword().equals(account.getPassword())){
				return true;
			}
		}
		
		return false;
	}
	@Override
	public Staff getUserById(String id) {
		// TODO Auto-generated method stub
		Staff staff=null;
		try {
			staff = sd.selectStaffById(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.closeConnection();
		}
		return staff;
>>>>>>> branch 'devolope' of git@github.com:Sally1997/Electric-power-engineering-project-management.git
	}

}
