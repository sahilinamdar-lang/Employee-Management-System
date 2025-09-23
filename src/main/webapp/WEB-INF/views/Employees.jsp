<%@ page import="com.sahil.springmvc.pojo.Employee"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Employees</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin:0; padding:0;
  background: url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
  color: #333;
  min-height: 100vh;
}

/* Container */
.container {
  width: 95%;
  max-width: 1100px;
  margin: 40px auto;
  background: rgba(255,255,255,0.95);
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

/* Header */
h2 {
    text-align:center;
    color:#1d3557;
    margin-bottom:25px;
    font-size:28px;
}

/* Message */
.message {
    text-align:center;
    margin:20px 0;
    padding:12px;
    border-radius:10px;
    font-weight:bold;
}
.message.success { background:#d4edda; color:#155724; }
.message.error { background:#f8d7da; color:#721c24; }

/* Search Form */
.search-form {
    text-align:center;
    margin-bottom:25px;
}
.search-form input[type="number"] {
    padding:10px 15px;
    border-radius:30px;
    border:2px solid #ddd;
    width:200px;
    outline:none;
    transition: all 0.3s ease;
    background:#fff;
}
.search-form input[type="number"]:focus {
    border-color:#2a9d8f;
    box-shadow:0 6px 12px rgba(0,0,0,0.1);
}
.search-form button {
    background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
    color: #fff;
    border:none;
    padding:10px 20px;
    border-radius:20px;
    cursor:pointer;
    font-weight:600;
    transition:all 0.3s ease;
    margin-left:10px;
}
.search-form button:hover {
    background: linear-gradient(90deg, #1d7a7b, #2a9d8f);
    transform:translateY(-2px);
}
.search-form a {
    background:#7f8c8d;
    color:#fff;
    padding:10px 20px;
    border-radius:20px;
    text-decoration:none;
    margin-left:10px;
}
.search-form a:hover { background:#555; }

/* Table */
table {
    width:100%; border-collapse:collapse; margin-top:25px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    border-radius:12px;
    overflow:hidden;
    background:#fff;
}
table th, table td { padding:15px; text-align:left; border-bottom:1px solid #e0e0e0; }
table th {
    background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
    color:#fff; font-weight:600; font-size:14px; text-transform:uppercase;
}
table tr:nth-child(even){ background-color:#f8f9fa; }
table tr:hover { background-color:#e0f7f5; transition:0.2s; }

/* Action Buttons */
.btn-update, .btn-delete {
    padding:8px 15px;
    border-radius:20px;
    border:none;
    cursor:pointer;
    font-size:14px;
    font-weight:600;
    transition:all 0.3s ease;
    margin-right:5px;
}
.btn-update {
    background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
    color:#fff;
}
.btn-update:hover {
    transform:scale(1.05);
    box-shadow:0 6px 20px rgba(0,0,0,0.2);
}
.btn-delete {
    background: linear-gradient(90deg, #e63946, #c5303f);
    color:#fff;
}
.btn-delete:hover {
    transform:scale(1.05);
    box-shadow:0 6px 20px rgba(0,0,0,0.2);
}

/* Footer */
.footer {
    text-align:center;
    margin-top:40px;
    padding:20px;
    color:#fff;
    font-size:14px;
}
</style>
</head>
<body>
<jsp:include page="Navbar.jsp" />

<div class="container">
    <h2>All Employees</h2>

    <!-- Message -->
    <c:if test="${not empty msg}">
        <div class="message ${msg.contains('successfully') ? 'success' : 'error'}">${msg}</div>
    </c:if>

    <!-- Search Form -->
    <div class="search-form">
        <form action="${pageContext.request.contextPath}/employees" method="get">
            <input type="number" name="id" placeholder="Search Employee by ID" required>
            <button type="submit">Search</button>
            <a href="${pageContext.request.contextPath}/employees">Show All</a>
        </form>
    </div>

    <!-- Employee Table -->
    <c:if test="${not empty employees}">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emp" items="${employees}">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.contact}</td>
                        <td>${emp.designation}</td>
                        <td>${emp.salary}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/update" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="${emp.id}">
                                <button type="submit" class="btn-update">Update</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/employees/remove" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${emp.id}">
                                <button type="submit" class="btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty employees}">
        <p style="text-align: center; margin-top: 20px; font-weight:600;">No employees found.</p>
    </c:if>
</div>

<div class="footer">
    <p>Employee Management System &copy; 2025</p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
