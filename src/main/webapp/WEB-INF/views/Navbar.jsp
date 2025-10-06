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
  background: rgba(255,255,255,0.9);
  backdrop-filter: blur(8px);
  border-bottom: 1px solid rgba(0,0,0,0.05);
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  font-family: 'Poppins', sans-serif;
  padding: 12px 25px;
  z-index: 1000;
}

.custom-navbar .navbar-brand {
  font-weight: 700;
  font-size: 1.7rem;
  color: #1a1a2e;
  transition: color 0.3s;
}
.custom-navbar .navbar-brand:hover {
  color: #2196F3;
}

.custom-navbar .navbar-nav .nav-link {
  font-weight: 500;
  color: #1a1a2e;
  margin-left: 12px;
  padding: 8px 15px;
  border-radius: 6px;
  transition: all 0.3s ease;
}

.custom-navbar .navbar-nav .nav-link:hover {
  background: linear-gradient(90deg, #2196F3, #4CAF50);
  color: #fff;
  transform: translateY(-2px);
}

.custom-navbar .navbar-toggler {
  border: none;
}
.custom-navbar .navbar-toggler:focus {
  box-shadow: none;
}

/* Gradient buttons for login/logout */
.navbar-nav .btn {
  font-weight: 600;
  border-radius: 50px;
  padding: 6px 18px;
  transition: all 0.4s ease;
  text-transform: uppercase;
}

.btn-login {
  background: linear-gradient(90deg, #2196F3, #03A9F4);
  color: #fff;
  border: none;
}
.btn-login:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(33,150,243,0.4);
}

.btn-logout {
  background: linear-gradient(90deg, #F44336, #E91E63);
  color: #fff;
  border: none;
}
.btn-logout:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(244,67,54,0.4);
}

/* Welcome text */
.welcome-text {
  font-weight: 500;
  color: #1a1a2e;
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
          String user = (String) session.getAttribute("adminUser");
          if (user == null) {
        %>
        <a class="btn btn-login ms-3" href="./login">Login</a>
        <% } else { %>
        <span class="welcome-text">Welcome, <%= user %></span>
        <a class="btn btn-logout ms-2" href="./logout">Logout</a>
        <% } %>
      </div>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
