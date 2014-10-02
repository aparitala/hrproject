package com.babu.dao;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.babu.model.Employee;
import com.babu.model.Employee;
import com.babu.util.DBUtil;

public class EmployeeDao {

	private Connection connection;

	public EmployeeDao() {
		connection = DBUtil.getConnection();
	}

	public void addEmployee(Employee empl) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into Employee(empFirstName, "
							+ "empLastName, empAdd1, empAdd2, empCity, empState, empZIP, empPhone, empStartDate)"
							+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(1, empl.getEmpFirstName());
			preparedStatement.setString(2, empl.getEmpLastName());
			preparedStatement.setString(3, empl.getEmpAdd1());
			preparedStatement.setString(4, empl.getEmpAdd2());
			preparedStatement.setString(5, empl.getEmpCity());
			preparedStatement.setString(6, empl.getEmpState());
			preparedStatement.setString(7, empl.getEmpZIP());
			preparedStatement.setString(8, empl.getEmpPhone());
			preparedStatement.setDate(9, new java.sql.Date(empl
					.getEmpStartDate().getTime()));

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteUser(int userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from users where userid=?");
			// Parameters start with 1
			preparedStatement.setInt(1, userId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateEmployee(Employee empl) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update Employee set empFirstName=?, empLastName=?, empAdd1 = ?, empAdd2 = ?, empCity = ?, empState = ?, empZIP = ?, empPhone = ?"
							+ "where empId=?");
			// Parameters start with 1
			preparedStatement.setString(1, empl.getEmpFirstName());
			preparedStatement.setString(2, empl.getEmpLastName());
			preparedStatement.setString(3, empl.getEmpAdd1());
			preparedStatement.setString(4, empl.getEmpAdd2());
			preparedStatement.setString(5, empl.getEmpCity());
			preparedStatement.setString(6, empl.getEmpState());
			preparedStatement.setString(7, empl.getEmpZIP());
			preparedStatement.setString(8, empl.getEmpPhone());
			preparedStatement.setInt(9, empl.getEmpId());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Employee> getEmployees(Long empId, String firstName,
			String lastName, Date startDate) {
		List<Employee> empls = new ArrayList<Employee>();
		List<String> query1 = new ArrayList<String>();
		try {
			StringBuilder selectEmp = new StringBuilder(
					"select * from Employee where ");
			if (empId != null) {
				selectEmp.append("empId=? ");
				query1.add("empId");
			}
			if (firstName != null && firstName.length() > 0
					&& query1.contains("empId")) {
				selectEmp.append("and empFirstName=? ");
				query1.add("firstName");
			} else if (firstName != null && firstName.length() > 0) {
				selectEmp.append("empFirstName=? ");
				query1.add("firstName");
			}

			if (lastName != null
					&& lastName.length() > 0
					&& (query1.contains("empId") || query1
							.contains("firstName"))) {
				selectEmp.append("and empLastName=? ");
				query1.add("lastName");
			} else if (lastName != null && lastName.length() > 0) {
				selectEmp.append("empLastName=? ");
				query1.add("lastName");
			}

			if (startDate != null
					&& (query1.contains("empId")
							|| query1.contains("firstName") || query1
								.contains("lastName"))) {
				selectEmp.append("and empStartDate=? ");
				query1.add("startDate");
			} else if (startDate != null) {
				selectEmp.append("empStartDate=? ");
				query1.add("startDate");
			}
			// System.out.println(selectEmp.toString());
			PreparedStatement preparedStatement = connection
					.prepareStatement(selectEmp.toString());
			int x = 1;
			if (query1.contains("empId")) {
				preparedStatement.setLong(x, empId);
				++x;
			}
			if (query1.contains("firstName")) {
				preparedStatement.setString(x, firstName);
				++x;
			}

			if (query1.contains("lastName")) {
				preparedStatement.setString(x, lastName);
				++x;
			}

			if (query1.contains("startDate")) {
				preparedStatement.setDate(x,
						new java.sql.Date(startDate.getTime()));
				++x;
			}

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Employee empl = new Employee();
				empl.setEmpId(rs.getInt("empId"));
				empl.setEmpFirstName(rs.getString("empFirstName"));
				empl.setEmpLastName(rs.getString("empLastName"));
				empl.setEmpAdd1(rs.getString("empAdd1"));
				empl.setEmpAdd2(rs.getString("empAdd2"));
				empl.setEmpCity(rs.getString("empCity"));
				empl.setEmpState(rs.getString("empState"));
				empl.setEmpZIP(rs.getString("empZIP"));
				empl.setEmpPhone(rs.getString("empPhone"));
				empl.setEmpStartDate(rs.getDate("empStartDate"));
				empls.add(empl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return empls;
	}

	public Employee getEmplById(Long empId) {
		Employee empl = new Employee();
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from employee where empId=?");
			preparedStatement.setLong(1, empId);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				empl.setEmpId(rs.getInt("empId"));
				empl.setEmpFirstName(rs.getString("empFirstName"));
				empl.setEmpLastName(rs.getString("empLastName"));
				empl.setEmpAdd1(rs.getString("empAdd1"));
				empl.setEmpAdd2(rs.getString("empAdd2"));
				empl.setEmpCity(rs.getString("empCity"));
				empl.setEmpState(rs.getString("empState"));
				empl.setEmpZIP(rs.getString("empZIP"));
				empl.setEmpPhone(rs.getString("empPhone"));
				empl.setEmpStartDate(rs.getDate("empStartDate"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return empl;
	}

	
}
