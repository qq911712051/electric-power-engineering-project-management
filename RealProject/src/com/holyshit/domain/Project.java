package com.holyshit.domain;

import java.util.Date;

public class Project {
	private String pno;
	private String pname;
	private String pmno;
	private Date stime;
	private Date etime;
	private String ptype;
	private String pbudget;
	private String pstage;
	private String pstate;
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPmno() {
		return pmno;
	}
	public void setPmno(String pmno) {
		this.pmno = pmno;
	}
	public Date getStime() {
		return stime;
	}
	public void setStime(Date stime) {
		this.stime = stime;
	}
	public Date getEtime() {
		return etime;
	}
	public void setEtime(Date etime) {
		this.etime = etime;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPbudget() {
		return pbudget;
	}
	public void setPbudget(String pbudget) {
		this.pbudget = pbudget;
	}
	public String getPstage() {
		return pstage;
	}
	public void setPstage(String pstage) {
		this.pstage = pstage;
	}
	public String getPstate() {
		return pstate;
	}
	public void setPstate(String pstate) {
		this.pstate = pstate;
	}
	
}