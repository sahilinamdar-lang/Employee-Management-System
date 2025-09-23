<%@ page import="com.sahil.springmvc.pojo.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Search</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  margin:0; padding:0;
  background: url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
  color: #333;
  min-height: 100vh;
}

.container {
  width: 90%;
  max-width: 1000px;
  margin: 40px auto;
  background: rgba(255,255,255,0.95);
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

h2 { text-align:center; color:#1d3557; margin-bottom:25px; font-size:28px; }

form { display:flex; justify-content:center; margin-bottom:30px; }

.search-box {
  display:flex; align-items:center;
  border:2px solid #ddd; border-radius:30px;
  padding:5px 20px; width:100%; max-width:450px;
  transition:all 0.3s ease; background:#fff;
}
.search-box:hover { border-color:#2a9d8f; box-shadow:0 6px 12px rgba(0,0,0,0.1); }

.search-box input[type="text"] {
  border:none; flex-grow:1; padding:12px; font-size:16px; outline:none;
  background:transparent;
}

.search-box input[type="submit"] {
  background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
  color: #fff;
  border:none;
  padding:10px 20px;
  border-radius:20px;
  cursor:pointer;
  font-size:16px;
  font-weight:600;
  transition:all 0.3s ease;
}
.search-box input[type="submit"]:hover {
  background: linear-gradient(90deg, #1d7a7b, #2a9d8f);
  transform:translateY(-2px);
}

table {
  width:100%; border-collapse:collapse; margin-top:25px;
  box-shadow:0 5px 15px rgba(0,0,0,0.08); border-radius:12px; overflow:hidden;
  background:#fff;
}

table th, table td { padding:15px; text-align:left; border-bottom:1px solid #e0e0e0; }

table th {
  background: linear-gradient(90deg, #2a9d8f, #1d7a7b);
  color:#fff; font-weight:600; font-size:14px; text-transform:uppercase;
}

table tr:nth-child(even){ background-color:#f8f9fa; }
table tr:hover { background-color:#e0f7f5; transition:0.2s; }
table tr:last-child td { border-bottom:none; }

.msg-box { text-align:center; margin:20px 0; font-weight:bold; padding:12px; border-radius:10px; }
.msg-box.success { background:#d4edda; color:#155724; }
.msg-box.error { background:#f8d7da; color:#721c24; }

</style>
</head>
<body>
<jsp:include page="Navbar.jsp" />
<div class="container">
<h2>Search Employee</h2>

<form action="./search" method="post">
  <div class="search-box">
    <input type="text" name="id" placeholder="Enter Employee ID" required>
    <input type="submit" value="Search">
  </div>
</form>

<c:if test="${not empty msg}">
  <div class="msg-box ${emp != null ? 'success' : 'error'}">${msg}</div>
</c:if>

<c:if test="${not empty emp}">
  <table>
    <thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Designation</th>
        <th>Salary</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${emp.id}</td>
        <td>${emp.name}</td>
        <td>${emp.email}</td>
        <td>${emp.contact}</td>
        <td>${emp.designation}</td>
        <td>${emp.salary}</td>
      </tr>
    </tbody>
  </table>
</c:if>
</div>
</body>
</html>
