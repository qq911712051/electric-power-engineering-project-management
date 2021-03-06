package com.holyshit.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import com.holyshit.domain.Staff;
import com.holyshit.service.StaffService;
import com.holyshit.service.impl.StaffServiceImpl;
import com.holyshit.utils.AutoNumber;

public class StaffInfoFindServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String s = request.getParameter("type");
		
		//获取pno和staffno
		String pno = request.getParameter("pno");
		HttpSession session = request.getSession();
		Staff staff = (Staff) session.getAttribute("staff");
		String userno = staff.getStaffno();
		
		String fp = request.getParameter("fp");
		int pagenum = 1;
		if(fp!=null){
			pagenum = Integer.parseInt(fp);
		}
		
		String keyword = request.getParameter("keyword");
		//linux服务器出现问题，乱码 袁奇中的垃圾代码，不顶用
		//keyword = new String(keyword.getBytes("ISO-8859-1"),"UTF-8"); 
		
		//返回的字符串str
		String str = "";
		//~~~~
		StaffService ss = new StaffServiceImpl();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if(s.equals("nptype")){
			if(fp==null){
				list = ss.showStaffCanSetProject(keyword);
			}
			else{
				list = ss.showStaffCanSetProject(keyword,pagenum);
			}
			
			str = JSONArray.fromObject(list).toString();
			String ja = JSONArray.fromObject(list).toString();
			AutoNumber an = new AutoNumber();
			str = an.transToArray(ja).toString();
		}
		else{
			if(fp==null){
				list = ss.queryStaffInCompany(pno, userno, keyword);
			}
			else{
				list = ss.queryStaffInCompany(pno, userno, keyword,pagenum);
			}
			str = JSONArray.fromObject(list).toString();
			String ja = JSONArray.fromObject(list).toString();
			AutoNumber an = new AutoNumber();
			str = an.transToArray(ja).toString();
		}
		
		//返回字符串
		response.getWriter().write(str);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
