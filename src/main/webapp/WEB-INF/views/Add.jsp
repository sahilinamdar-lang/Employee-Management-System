<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String msg=(String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
body, html {
  margin: 0;
  padding: 0;
  font-family: 'Poppins', sans-serif;
  height: 100%;
  background: linear-gradient(135deg, #667eea, #764ba2);
}

/* Background Section */
.bg-section {
  background: url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1600&q=80') no-repeat center center/cover;
  min-height: 100vh;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}

.bg-section::before {
  content: "";
  position: absolute;
  inset: 0;
  background: rgba(29, 53, 87, 0.7);
}

/* Form Card */
.form-card {
  position: relative;
  z-index: 1;
  background: rgba(255, 255, 255, 0.95);
  padding: 40px;
  border-radius: 20px;
  width: 100%;
  max-width: 600px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
  animation: fadeInUp 1s ease;
}

.form-card h2 {
  color: #1d3557;
  font-weight: 700;
  margin-bottom: 25px;
  text-align: center;
}

/* Input Styles */
.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 6px;
  font-weight: 600;
  color: #333;
}

input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 10px;
  font-size: 16px;
  transition: all 0.3s ease;
}

input:focus {
  outline: none;
  border-color: #457b9d;
  box-shadow: 0 0 12px rgba(69,123,157,0.3);
  transform: translateY(-1px);
}

/* Button */
.submit-btn {
  width: 100%;
  padding: 14px;
  background: linear-gradient(90deg, #667eea, #764ba2);
  color: white;
  border: none;
  border-radius: 12px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 5px 15px rgba(0,0,0,0.15);
}

.submit-btn:hover {
  background: linear-gradient(90deg, #764ba2, #667eea);
  transform: translateY(-3px);
  box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

/* Message Box */
.msg-box {
  margin-top: 20px;
  text-align: center;
  font-weight: 600;
  font-size: 1.1rem;
  padding: 10px 15px;
  border-radius: 12px;
  background-color: #d4edda;
  color: #155724;
}

/* Animations */
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(40px); }
  to { opacity: 1; transform: translateY(0); }
}

@media (max-width: 768px) {
  .form-card {
    padding: 25px;
  }
}
</style>
</head>
<body>

<jsp:include page="Navbar.jsp" />

<section class="bg-section">
  <div class="form-card">
    <h2>Add New Employee</h2>
    <form action="./add" method="post">
      <div class="form-group">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="name" placeholder="e.g., John Doe" required>
      </div>
      <div class="form-group">
        <label for="emailAddress">Email Address</label>
        <input type="email" id="emailAddress" name="email" placeholder="e.g., example@domain.com" required>
      </div>
      <div class="form-group">
        <label for="contactNumber">Contact Number</label>
        <input type="tel" id="contactNumber" name="contact" placeholder="e.g., 9876543210" required>
      </div>
      <div class="form-group">
        <label for="designation">Designation</label>
        <input type="text" id="designation" name="designation" placeholder="e.g., Software Engineer" required>
      </div>
      <div class="form-group">
        <label for="salary">Salary</label>
        <input type="number" id="salary" name="salary" placeholder="e.g., 50000" required>
      </div>
      <button type="submit" class="submit-btn">Add Employee</button>
    </form>

    <% if(msg!=null){ %>
      <div class="msg-box">
        <%=msg %>
      </div>
    <% } %>
  </div>
</section>

<% if(msg!=null){ %>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    Swal.fire({
      icon: 'success',
      title: '<%=msg%>',
      showConfirmButton: false,
      timer: 2000
    });
  </script>
<% } %>

</body>
</html>
