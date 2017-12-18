package com.holyshit.Dao.impl;

import static org.junit.Assert.*;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.inject.New;

import net.sf.json.JSONArray;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.holyshit.Dao.DocumentDao;
import com.holyshit.domain.Document;
import com.holyshit.domain.DocumentInfo;
import com.holyshit.utils.ConnectionManager;

public class DocumentDaoImpl implements DocumentDao{

	@Override
	public List<Document> selectAllDocumentByUserId(String id,int cur,int pageSize)
			throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner();
		//获取大小
		//
		List<Document> list=qr.query(ConnectionManager.getConnection(),
				"SELECT * FROM psrelation JOIN document ON psrelation.pno=document.pno WHERE staffno=? order by uploadtime desc limit ?,?",
				new BeanListHandler<Document>(Document.class),
				id,(cur-1)*pageSize,pageSize);
		return list;
	}

	@Override
	public long totalSizeWithId(String id) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner();
		return (Long)qr.query(ConnectionManager.getConnection(),
				"SELECT COUNT(*) FROM psrelation JOIN document ON psrelation.pno=document.pno WHERE staffno=?",
				new ScalarHandler(),
				id);
	}

	@Override
	public Document getDocumentById(String dno) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner();
		return qr.query(ConnectionManager.getConnection(), "select * from document where dno=?", new BeanHandler<Document>(Document.class),dno);
	}

	@Override
	public List<DocumentInfo> selectDocumentByCondition(String dtype,
			String dateFrom, String dateTo, String keywords, String ftype,int cur,int pageSize)
			throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner();
		String sql="select dno,UloadPNo,DTitle,UploadTime,FType,PName,dloadtimes from document join project on document.pno=project.pno where dtype="+dtype;
		if(!dateTo.equals(""))
			sql+=" and uploadtime<='"+dateTo+"'";
		if(!dateFrom.equals(""))
			sql+=" and uploadtime>='"+dateFrom+"'";
		if(!keywords.equals(""))
			sql+=" and dtitle like '%"+keywords+"%'";
		if(!ftype.equals("")){
			String[] types = ftype.split(":");
			sql+=" and (";
			for(int i=0;i<types.length;i++)
				if(i==0)
					sql+="ftype='"+types[i]+"'";
				else{
					sql+=" or ftype='"+types[i]+"'";
				}
			sql+=" )";		
		}
		sql+=" limit "+cur+","+pageSize;
		System.out.println(sql);
		return qr.query(ConnectionManager.getConnection(), sql,new BeanListHandler<DocumentInfo>(DocumentInfo.class));
	}

	@Override
	public long totalNumWithCondition(String dtype, String dateFrom,
			String dateTo, String keywords, String ftype) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr=new QueryRunner();
		
		String sql="select count(*) from document where dtype="+dtype;
		if(!dateTo.equals(""))
			sql+=" and uploadtime<='"+dateTo+"'";
		if(!dateFrom.equals(""))
			sql+=" and uploadtime>='"+dateFrom+"'";
		if(!keywords.equals(""))
			sql+=" and dtitle like '%"+keywords+"%'";
		if(!ftype.equals("")){
			String[] types = ftype.split(":");
			sql+=" and (";
			for(int i=0;i<types.length;i++)
				if(i==0)
					sql+="ftype='"+types[i]+"'";
				else{
					sql+=" or ftype='"+types[i]+"'";
				}
			sql+=" )";		
		}
		return (long) qr.query(ConnectionManager.getConnection(), sql,new ScalarHandler());
	}

}
