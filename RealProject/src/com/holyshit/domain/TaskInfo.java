package com.holyshit.domain;

import java.sql.Date;

public class TaskInfo {
	private String pname;
	private String sname;
	private String taskname;
	private String pno;
	private String stageno;
	private String taskno;
	private double budget;
	private String charpno;
	private String ptaskno;
	private String ptasktype;
	private Date stime;
	private Date etime;
	private String tstate;
	
	public String getTstate() {
		return tstate;
	}
	public void setTstate(String tstate) {
		this.tstate = tstate;
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
	public String getPtasktype() {
		return ptasktype;
	}
	public void setPtasktype(String ptasktype) {
		this.ptasktype = ptasktype;
	}
	public String getPtaskno() {
		return ptaskno;
	}
	public void setPtaskno(String ptaskno) {
		this.ptaskno = ptaskno;
	}
	public String getCharpno() {
		return charpno;
	}
	public void setCharpno(String charpno) {
		this.charpno = charpno;
	}
	
	public double getBudget() {
		return budget;
	}
	public void setBudget(double budget) {
		this.budget = budget;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getStageno() {
		return stageno;
	}
	public void setStageno(String stageno) {
		this.stageno = stageno;
	}
	public String getTaskno() {
		return taskno;
	}
	public void setTaskno(String taskno) {
		this.taskno = taskno;
	}
	@Override
	public String toString() {
		return "TaskInfo [pname=" + pname + ", sname=" + sname + ", taskname="
				+ taskname + ", pno=" + pno + ", stageno=" + stageno
				+ ", taskno=" + taskno + ", budget=" + budget + ", charpno="
				+ charpno + ", ptaskno=" + ptaskno + ", ptasktype=" + ptasktype
				+ ", stime=" + stime + ", etime=" + etime + ", tstate="
				+ tstate + "]";
	}
	
}
