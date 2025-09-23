<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home - Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body, html {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    background: #f4f6fa;
    scroll-behavior: smooth;
}

/* ===== Hero Section ===== */
.hero-section {
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: #fff;
    padding: 120px 20px;
    position: relative;
    text-align: center;
    overflow: hidden;
    border-radius: 0 0 50% 50% / 0 0 10% 10%;
}

.hero-section::before {
    content: "";
    position: absolute;
    inset: 0;
    background: rgba(0, 0, 0, 0.2);
    mix-blend-mode: overlay;
}

.hero-section .content {
    position: relative;
    z-index: 1;
}

.hero-section h1 {
    font-size: 3rem;
    font-weight: 700;
    animation: fadeInDown 1s ease;
}

.hero-section p {
    font-size: 1.3rem;
    margin-top: 15px;
    animation: fadeInUp 1.2s ease;
}

/* ===== Company Logos ===== */
.company-logos {
    margin-top: 40px;
    display: flex;
    justify-content: center;
    gap: 40px;
    flex-wrap: wrap;
    z-index: 1;
    position: relative;
}

.company-logos img {
    height: 50px;
    filter: brightness(0) invert(1);
    opacity: 0.9;
    transition: transform 0.3s ease, opacity 0.3s ease;
}

.company-logos img:hover {
    transform: scale(1.2) rotate(-5deg);
    opacity: 1;
}

/* ===== Action Cards ===== */
.action-cards .card {
    transition: all 0.4s ease;
    border-radius: 1rem;
    overflow: hidden;
    position: relative;
    background: linear-gradient(145deg, #ffffff, #f0f3f8);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

.action-cards .card:hover {
    transform: translateY(-10px) scale(1.03);
    box-shadow: 0 25px 50px rgba(0,0,0,0.15);
}

.action-cards .card .btn {
    transition: all 0.3s ease;
}

.action-cards .card:hover .btn {
    transform: scale(1.05);
}

/* Gradient Buttons */
.btn-primary { background: linear-gradient(90deg, #667eea, #764ba2); border: none; color: #fff; }
.btn-success { background: linear-gradient(90deg, #43e97b, #38f9d7); border: none; color: #fff; }
.btn-warning { background: linear-gradient(90deg, #f7971e, #ffd200); border: none; color: #fff; }
.btn-danger { background: linear-gradient(90deg, #ff416c, #ff4b2b); border: none; color: #fff; }

.btn:hover { box-shadow: 0 8px 20px rgba(0,0,0,0.3); }

/* ===== Footer ===== */
footer {
    background-color: #1a1a2e;
    padding: 25px 0;
    text-align: center;
    color: #f0f0f0;
    margin-top: 60px;
    border-top: 1px solid #333;
}

/* ===== Animations ===== */
@keyframes fadeInDown {
    from { opacity: 0; transform: translateY(-40px); }
    to { opacity: 1; transform: translateY(0); }
}
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(40px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>
<body>

<!-- Navigation Bar -->
<jsp:include page="Navbar.jsp"/>

<!-- Hero Section -->
<section class="hero-section">
  <div class="container content">
    <h1>Welcome to Employee Management</h1>
    <p class="lead">Effortlessly manage employee data — add, search, update, and remove records with ease.</p>
    
    <!-- Company Logos -->
    <div class="company-logos animate__animated animate__fadeInUp animate__delay-1s">
      <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg" alt="Google" onerror="this.style.display='none'" />
      <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg" alt="Microsoft" onerror="this.style.display='none'" />
      <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/IBM_logo.svg" alt="IBM" onerror="this.style.display='none'" />
      <img src="/images/tcs-logo.png" alt="TCS" onerror="this.style.display='none'" />
      <img src="/images/infosys-logo.png" alt="Infosys" onerror="this.style.display='none'" />
    </div>
  </div>
</section>

<!-- Quick Actions -->
<section class="container my-5 action-cards">
  <div class="row g-4 text-center">
    <div class="col-md-3 animate__animated animate__fadeInUp animate__delay-1s">
      <div class="card h-100 border-0">
        <div class="card-body">
          <h5 class="card-title">Add Employee</h5>
          <p class="card-text">Create a new employee record.</p>
          <a href="./add" class="btn btn-primary w-100">Add</a>
        </div>
      </div>
    </div>

    <div class="col-md-3 animate__animated animate__fadeInUp animate__delay-2s">
      <div class="card h-100 border-0">
        <div class="card-body">
          <h5 class="card-title">Search Employee</h5>
          <p class="card-text">Find employee details easily.</p>
          <a href="./search" class="btn btn-success w-100">Search</a>
        </div>
      </div>
    </div>

    <div class="col-md-3 animate__animated animate__fadeInUp animate__delay-3s">
      <div class="card h-100 border-0">
        <div class="card-body">
          <h5 class="card-title">Update Info</h5>
          <p class="card-text">Modify employee data as needed.</p>
          <a href="./update" class="btn btn-warning w-100">Update</a>
        </div>
      </div>
    </div>

    <div class="col-md-3 animate__animated animate__fadeInUp animate__delay-4s">
      <div class="card h-100 border-0">
        <div class="card-body">
          <h5 class="card-title">Remove Employee</h5>
          <p class="card-text">Delete a record from the system.</p>
          <a href="./employees" class="btn btn-danger w-100">Remove</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer>
  <div class="container">
    <p>&copy; 2025 Employee Management System. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
