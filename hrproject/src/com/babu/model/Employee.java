package com.babu.model;
import java.util.Date;

public class Employee {
	
	 private int empId;
	 private String empFirstName;
	 private String empLastName;
	 private String empAdd1;
	 private String empAdd2;
	 private String empCity;
	 private String empState;
	 private String empZIP;
	 private String empPhone;
	 private Date empStartDate;
	 
	 
	 @Override
	    public String toString() {
	        return "Employee [empId=" + empId + ", empFirstName=" + empFirstName
	                + ", empLastName=" + empLastName + ", empAdd1=" + empAdd1 
	                + ", empAdd2=" + empAdd2 + ", empCity=" + empCity
	                + ", empState=" + empState + ", empZIP=" + empZIP
	                + ", empPhone=" + empPhone + ", dob=" + empStartDate + "]";
	    } 
	 
	 
	 
	 public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpFirstName() {
		return empFirstName;
	}
	public void setEmpFirstName(String empFirstName) {
		this.empFirstName = empFirstName;
	}
	public String getEmpLastName() {
		return empLastName;
	}
	public void setEmpLastName(String empLastName) {
		this.empLastName = empLastName;
	}
	public String getEmpAdd1() {
		return empAdd1;
	}
	public void setEmpAdd1(String empAdd1) {
		this.empAdd1 = empAdd1;
	}
	public String getEmpAdd2() {
		return empAdd2;
	}
	public void setEmpAdd2(String empAdd2) {
		this.empAdd2 = empAdd2;
	}
	public String getEmpCity() {
		return empCity;
	}
	public void setEmpCity(String empCity) {
		this.empCity = empCity;
	}
	public String getEmpState() {
		return empState;
	}
	public void setEmpState(String empState) {
		this.empState = empState;
	}
	public String getEmpZIP() {
		return empZIP;
	}
	public void setEmpZIP(String empZIP) {
		this.empZIP = empZIP;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public Date getEmpStartDate() {
		return empStartDate;
	}
	public void setEmpStartDate(Date empStartDate) {
		this.empStartDate = empStartDate;
	}
	 

}
