<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Admin - Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
}
.register-card {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 50px 40px;
    max-width: 400px;
    text-align: center;
    box-shadow: 0 20px 50px rgba(0,0,0,0.3);
}
.register-card h2 { font-weight: 700; color: #fff; margin-bottom: 20px; }
.register-card .form-control { border-radius: 12px; margin-bottom: 20px; border: none; padding: 14px; }
.register-card .btn-primary {
    background: linear-gradient(90deg, #667eea, #764ba2);
    border: none;
    border-radius: 12px;
    padding: 14px;
    font-weight: 600;
}
.message {
    margin-top: 15px;
    font-weight: bold;
}
.message.success { color: lightgreen; }
.message.error { color: red; }
</style>
</head>
<body>

<div class="register-card">
    <i class="fas fa-user-plus fa-3x" style="color:white;"></i>
    <h2>Create Admin</h2>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <input type="text" name="username" class="form-control" placeholder="Username" required>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>

    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/login" style="color:#ffe600;">Back to Login</a>
    </div>

    <!-- Success / Error message & redirect -->
    <c:if test="${not empty msg}">
        <div class="message ${msg eq '✅ Admin registered successfully!' ? 'success' : 'error'}">
            ${msg}
        </div>
        <c:if test="${msg eq '✅ Admin registered successfully!'}">
            <script>
                // Redirect to login after 2 seconds
                setTimeout(function() {
                    window.location.href = '${pageContext.request.contextPath}/login';
                }, 2000);
            </script>
        </c:if>
    </c:if>
</div>

</body>
</html>
