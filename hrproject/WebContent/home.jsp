<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HR Main Page</title>
<style>
.bigbutton {
	width: 200px;
	height: 40px;
}
.table {
  width:500px;
  margin: 10px auto;
}
</style>
</head>
<body>
	<table class='table'>
	   <tr>
			<td align="center">
				
			<h3>Employee Registration Home Page </h3>
				
			</td>
		</tr>
		<tr>
			<td align="center">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td align="center">
				<form method="post" ACTION="employee.jsp">
					<input type="submit" class='bigbutton' value="Add New Employee">
				</form>
			</td>
		</tr>
		<tr>
			<td align="center">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td align="center">
				<form method="post" action="searchEmployee.jsp">
					<input type="submit" class='bigbutton' value="Search and Update Employee">
				</form>
			</td>
		</tr>
	</table>
</body>

</html>