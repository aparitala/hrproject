<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>
<%@ page import="com.babu.model.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<% 
ArrayList<Employee> empls = (ArrayList<Employee>) session.getAttribute("empls");
//System.out.println(empls);
//session.setAttribute("empls", "");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All EMployees</title>
</head>
<body>
    <table border="1px" cellpadding="4 px" cellspacing="0" >
        <thead>
            <tr>
                <th>Action</th>
                <th>Employee Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address 1</th>
                <th>Address 2</th>
                <th>City</th>
                <th>State</th>
                <th>ZIP</th>
                <th>Phone</th>
                <th>Start Date</th>
                
            </tr>
        </thead>
        <tbody>
              <c:forEach items="${empls}" var="empl">  
                <tr> 
                    <td><a href="updateEmployee?action=edit&empId=<c:out value="${empl.empId}"/>">Update</a></td>                
                    <td><c:out value="${empl.empId}" /></td>
                    <td><c:out value="${empl.empFirstName}" /></td>
                    <td><c:out value="${empl.empLastName}" /></td>
                    <td><c:out value="${empl.empAdd1}" /></td>
                    <td><c:out value="${empl.empAdd2}" /></td>
                    <td><c:out value="${empl.empCity}" /></td>
                    <td><c:out value="${empl.empState}" /></td>
                    <td><c:out value="${empl.empZIP}" /></td>
                    <td><c:out value="${empl.empPhone}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${empl.empStartDate}" /></td>
                </tr>
              </c:forEach>
           
        </tbody>
    </table>
    
</body>
</html>