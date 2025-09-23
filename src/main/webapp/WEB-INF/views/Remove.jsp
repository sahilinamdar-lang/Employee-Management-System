<%@page import="com.sahil.springmvc.pojo.Employee"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
String msg = (String) request.getAttribute("msg");
List<Employee> employees = (List<Employee>) request.getAttribute("employees");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>All Employees</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	margin: 0;
	padding: 0;
	background:
		url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1600&q=80')
		center/cover no-repeat;
}

.container {
	width: 90%;
	max-width: 1000px;
	margin: 40px auto;
	padding: 30px;
	background: rgba(255, 255, 255, 0.95);
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #1d3557;
	margin-bottom: 25px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	background: #fff;
}

table th, table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #e0e0e0;
}

table th {
	background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
	color: #fff;
	font-weight: 600;
	text-transform: uppercase;
}

table tr:nth-child(even) {
	background: #f8f9fa;
}

table tr:hover {
	background: #e0f7f5;
	transition: 0.2s;
}

.btn-update {
	background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
	color: #fff;
	border: none;
	padding: 6px 12px;
	border-radius: 6px;
	cursor: pointer;
}

.btn-update:hover {
	background: linear-gradient(90deg, #1d7a7b, #2a9d8f);
}

.btn-delete {
	background: linear-gradient(90deg, #e63946, #d90429);
	color: #fff;
	border: none;
	padding: 6px 12px;
	border-radius: 6px;
	cursor: pointer;
}

.btn-delete:hover {
	background: linear-gradient(90deg, #d90429, #e63946);
}

.msg-box {
	text-align: center;
	font-weight: 600;
	margin-bottom: 15px;
	padding: 10px 12px;
	border-radius: 10px;
	background: #d4edda;
	color: #155724;
}
</style>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<h2>All Employees</h2>

		<%
		if (msg != null) {
		%>
		<div class="msg-box"><%=msg%></div>
		<%
		}
		%>

		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Designation</th>
					<th>Salary</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (employees != null && !employees.isEmpty()) {
					for (Employee emp : employees) {
				%>
				<tr>
					<td><%=emp.getId()%></td>
					<td><%=emp.getName()%></td>
					<td><%=emp.getEmail()%></td>
					<td><%=emp.getContact()%></td>
					<td><%=emp.getDesignation()%></td>
					<td><%=emp.getSalary()%></td>
					<td>
						<form action="update" method="get" style="display: inline;">
							<input type="hidden" name="id" value="<%=emp.getId()%>">
							<button type="submit" class="btn-update">Update</button>
						</form>
						<form action="employees/remove" method="post"
							style="display: inline;">
							<input type="hidden" name="id" value="<%=emp.getId()%>">
							<button type="submit" class="btn-delete">Delete</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="7" class="text-center">No employees found</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
