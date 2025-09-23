<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login - Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body, html {
    height: 100%;
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background: linear-gradient(135deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Centered glass card */
.login-card {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 50px 40px;
    width: 100%;
    max-width: 400px;
    text-align: center;
    box-shadow: 0 20px 50px rgba(0,0,0,0.3);
    animation: fadeIn 1s ease forwards;
}

/* Animations */
@keyframes fadeIn {
    0% {opacity: 0; transform: translateY(-20px);}
    100% {opacity: 1; transform: translateY(0);}
}

.login-card h2 {
    font-weight: 700;
    color: #fff;
    margin-bottom: 10px;
}

.login-card p {
    color: #e0e0e0;
    margin-bottom: 30px;
}

.login-card .form-control {
    border-radius: 12px;
    padding: 14px 15px;
    margin-bottom: 20px;
    border: none;
    transition: all 0.3s ease;
}

.login-card .form-control:focus {
    box-shadow: 0 0 10px rgba(255,255,255,0.5);
    border: none;
}

.login-card .btn-primary {
    background: linear-gradient(90deg, #667eea, #764ba2);
    border: none;
    border-radius: 12px;
    padding: 14px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.login-card .btn-primary:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
}

.login-card .forgot-link a {
    color: #fff;
    text-decoration: none;
    transition: all 0.2s ease;
}

.login-card .forgot-link a:hover {
    text-decoration: underline;
    color: #ffe600;
}

.login-card i {
    color: #fff;
    background: rgba(255,255,255,0.2);
    padding: 20px;
    border-radius: 50%;
    margin-bottom: 20px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Responsive adjustments */
@media (max-width: 480px) {
    .login-card {
        padding: 40px 20px;
    }
}
</style>
</head>
<body>

<div class="login-card">
    <i class="fas fa-user-shield fa-3x"></i>
    <h2>Admin Login</h2>
    <p>Sign in with your admin credentials</p>
    <form action="login" method="post">
        <input type="text" name="username" class="form-control" placeholder="Username" required>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
    <div class="forgot-link mt-3">
        <a href="./forgot-password.jsp">Forgot Password?</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
