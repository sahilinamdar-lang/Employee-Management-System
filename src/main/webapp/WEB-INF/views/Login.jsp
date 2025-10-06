<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login - Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
<style>
/* Same CSS as before */
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
}
.login-card {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 50px 40px;
    max-width: 400px;
    text-align: center;
    box-shadow: 0 20px 50px rgba(0,0,0,0.3);
}
.login-card h2 { font-weight: 700; color: #fff; margin-bottom: 10px; }
.login-card p { color: #e0e0e0; margin-bottom: 30px; }
.login-card .form-control { border-radius: 12px; margin-bottom: 20px; border: none; padding: 14px; }
.login-card .btn-primary {
    background: linear-gradient(90deg, #667eea, #764ba2);
    border: none;
    border-radius: 12px;
    padding: 14px;
    font-weight: 600;
}
</style>
</head>
<body>

<div class="login-card">
    <i class="fas fa-user-shield fa-3x"></i>
    <h2>Admin Login</h2>
    <p>Sign in with your admin credentials</p>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <input type="text" name="username" class="form-control" placeholder="Username" required>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/admin/forgot" style="color:#ffe600;">Forgot Password?</a><br>
        <a href="${pageContext.request.contextPath}/register" style="color:#ffe600;">Create Admin Account</a>
    </div>

    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
    <c:if test="${not empty msg}">
        <p style="color:lightgreen;">${msg}</p>
    </c:if>
</div>

</body>
</html>
