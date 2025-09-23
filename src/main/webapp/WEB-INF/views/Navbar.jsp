<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Modern Navbar Styling */
.custom-navbar {
  background-color: #ffffff;
  border-bottom: 1px solid #dee2e6;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  padding: 10px 20px;
  z-index: 1000;
}

.custom-navbar .navbar-brand {
  font-weight: 600;
  font-size: 1.6rem;
  color: #2c3e50;
}

.custom-navbar .navbar-nav .nav-link {
  font-weight: 500;
  color: #34495e;
  margin-left: 10px;
  padding: 8px 12px;
  border-radius: 4px;
  transition: background-color 0.3s, color 0.3s;
}

.custom-navbar .navbar-nav .nav-link:hover {
  background-color: #e8f0fe;
  color: #1a237e;
}

.custom-navbar .navbar-toggler {
  border: none;
}

.custom-navbar .navbar-toggler:focus {
  box-shadow: none;
}

/* Buttons */
.navbar-nav .btn {
  font-weight: 500;
  border-radius: 6px;
}

/* Welcome message */
.welcome-text {
  font-weight: 500;
  color: #2c3e50;
  margin-right: 15px;
}

@media (max-width: 991.98px) {
  .custom-navbar .navbar-nav {
    text-align: center;
    margin-top: 10px;
  }
  .custom-navbar .navbar-nav .nav-link {
    margin-left: 0;
  }
  .welcome-text {
    display: block;
    margin: 10px 0;
  }
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg custom-navbar sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="./home">Linkcode</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
      <div class="navbar-nav align-items-lg-center">
        <a class="nav-link" href="./home">Home</a>
        <a class="nav-link" href="./add">Add</a>
        <a class="nav-link" href="./search">Search</a>
        <a class="nav-link" href="./update">Update</a>
        <a class="nav-link" href="./employees">Remove</a>

        <%
          String user = (String) session.getAttribute("username");
          if (user == null) {
        %>
            <a class="btn btn-outline-primary ms-3" href="./login">Login</a>
        <% } else { %>
            <span class="welcome-text">Welcome, Admin</span>
            <a class="btn btn-outline-danger ms-2" href="./logout">Logout</a>
        <% } %>
      </div>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
