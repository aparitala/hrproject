package com.babu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babu.dao.EmployeeDao;
import com.babu.model.Employee;


public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/employeeEdit.jsp";	
	private static String HOME_PAGE = "/home.jsp";
	private EmployeeDao dao;

	public EmployeeController() {
		super();
		dao = new EmployeeDao();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		HttpSession session = request.getSession(true);
		String action = request.getParameter("action");
		String empId = request.getParameter("id");
		
		if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			Long emplId = Long.parseLong(request.getParameter("empId"));
			Employee employee = dao.getEmplById(emplId);
			request.setAttribute("employee", employee);
			RequestDispatcher view = request.getRequestDispatcher(forward);
			view.forward(request, response);
		} else if (action.equalsIgnoreCase("emplSearch")) {
		
		Long emplId = null;		
		if (empId != null && empId.length() > 0)
		  emplId = Long.valueOf(request.getParameter("id"));
		
		String emplFirstName = request.getParameter("firstName");
		String emplLastName = request.getParameter("lastName");
		String emplStartDate = request.getParameter("startDate");
		response.setContentType("text/html;UTF-8");
		Date startDate = null;
		try {
			if (emplStartDate != null && emplStartDate.length() > 0)
				startDate = new SimpleDateFormat("MM/dd/yyyy").parse(emplStartDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<Employee> empls = dao.getEmployees(emplId, emplFirstName, emplLastName, 
				startDate);
		session.setAttribute("empls", empls);
		String text = "";
		if (! (empls.size() > 0)) {
			text = "No Records Found";
		}	
		StringBuilder htmlTable = new StringBuilder();		
        // Set response body content. response body is returned as Ajax Response Text
        PrintWriter writer = response.getWriter();
       
        writer.write(text.toString());
        writer.close();	
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Employee empl = new Employee();
		Enumeration names = request.getParameterNames();
		/*while (names.hasMoreElements()) {
			String varName = (String) names.nextElement();
			String varValue = (String) request.getParameter(varName);
			System.out.println("varName:  " + varName + "varValue:  " + varValue);
		}*/
		
		empl.setEmpFirstName(request.getParameter("empFirstName"));
		empl.setEmpLastName(request.getParameter("empLastName"));
		empl.setEmpAdd1(request.getParameter("empAddr1"));
		empl.setEmpAdd2(request.getParameter("empAddr2"));
		empl.setEmpCity(request.getParameter("empCity"));
		try {
			Date startDate = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter("empStartDate"));
			empl.setEmpStartDate(startDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		empl.setEmpState(request.getParameter("empState"));
		empl.setEmpZIP(request.getParameter("empZIP"));
		empl.setEmpPhone(request.getParameter("empPhone"));
		
		//System.out.println(empl);
		String actionType = request.getParameter("actionType");
		if (actionType != null && actionType.length() > 0  && actionType.equals("employeeEdit")) {
			empl.setEmpId(Integer.parseInt(request.getParameter("empId")));
			dao.updateEmployee(empl);
			RequestDispatcher view = request.getRequestDispatcher(HOME_PAGE);
			//request.setAttribute("users", dao.getAllUsers());
			view.forward(request, response);
			return;
		}
		
		dao.addEmployee(empl);
		RequestDispatcher view = request.getRequestDispatcher(HOME_PAGE);
		//request.setAttribute("users", dao.getAllUsers());
		view.forward(request, response);
		
	}
	
	
	
}
