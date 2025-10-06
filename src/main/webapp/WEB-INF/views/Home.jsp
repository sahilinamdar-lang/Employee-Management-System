<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home - Employee Management 🚀</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap');

:root {
    --primary-color: #4CAF50;
    --secondary-color: #2196F3;
    --accent-color: #FF9800;
    --bg-light: #f4f6fa;
    --card-shadow: 0 10px 30px rgba(0,0,0,0.08);
    --hover-shadow: 0 20px 40px rgba(0,0,0,0.15);
}

body, html {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background: var(--bg-light);
    scroll-behavior: smooth;
    overflow-x: hidden;
}

/* ======================================= */
/* Hero Section                            */
/* ======================================= */
.hero-section {
    position: relative;
    text-align: center;
    padding: 180px 20px 100px;
    overflow: hidden;
}

.hero-bg {
    position: absolute;
    inset: 0;
    background: url('https://images.unsplash.com/photo-1542744095-fcf5bc68ed55?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3') no-repeat center center/cover;
    z-index: 0;
}

.hero-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(66,133,244,0.2), rgba(76,175,80,0.2));
    backdrop-filter: blur(2px);
    z-index: 1;
    animation: gradientShift 15s ease-in-out infinite alternate;
}

.floating-shape {
    position: absolute;
    border-radius: 50%;
    opacity: 0.15;
    z-index: 2;
    animation: floatShape 10s ease-in-out infinite alternate;
}
.shape1 { width: 120px; height: 120px; background: rgba(255,193,7,0.3); top: 20%; left: 10%; }
.shape2 { width: 180px; height: 180px; background: rgba(76,175,80,0.3); top: 50%; left: 80%; }
.shape3 { width: 100px; height: 100px; background: rgba(33,150,243,0.3); top: 70%; left: 30%; }

.hero-section .content { position: relative; z-index: 3; color: #1a1a2e; }

.hero-section h1 {
    font-size: clamp(2.5rem,5vw,4.5rem);
    font-weight: 800;
    margin-bottom: 15px;
    background: linear-gradient(90deg, #1a1a2e, #007bff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    animation: fadeInDown 1s ease forwards;
}
.hero-section p {
    font-size: clamp(1rem,2vw,1.5rem);
    margin-top: 15px;
    font-weight: 400;
    color: #495057;
    animation: fadeInUp 1.2s ease forwards;
}

/* Company Logos Carousel */
.company-logos {
    margin-top: 50px;
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
    z-index:3;
    position: relative;
}
.company-logos img {
    height: 50px;
    filter: grayscale(0%) brightness(1);
    opacity: 1;
    transition: all 0.5s ease-in-out;
    animation: floatLogo 4s ease-in-out infinite alternate;
}
.company-logos img:nth-child(even){ animation-delay: -2s; }
.company-logos img:hover{ transform: scale(1.1) rotateY(10deg); }

/* ======================================= */
/* Action Cards Glassmorphism               */
/* ======================================= */
.action-cards { margin-top: -50px; z-index: 10; position: relative; }
.action-cards .card {
    background: rgba(255,255,255,0.95); backdrop-filter: blur(8px);
    border: 1px solid rgba(255,255,255,0.3); border-radius: 1.5rem;
    overflow: hidden; transition: all 0.5s ease; box-shadow: var(--card-shadow);
}
.action-cards .card:hover { transform: translateY(-15px) scale(1.05) rotateX(2deg); box-shadow: var(--hover-shadow); border-color: var(--secondary-color);}
.card-body { padding: 30px; text-align: center; }
.card-title { font-weight:700; margin-bottom:10px; color:#1a1a2e; }
.card-icon {
    font-size:3rem; margin-bottom:20px;
    background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
    -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    transition: transform 0.4s ease;
}
.card:hover .card-icon{ transform: scale(1.1) rotate(-5deg); }

.btn-modern{
    padding:10px 20px; border-radius:50px; font-weight:600; text-transform:uppercase; letter-spacing:1px;
    box-shadow:0 5px 15px rgba(0,0,0,0.15); transition: all 0.4s ease; border:none; color:#fff;
}
.btn-modern:hover{ transform:translateY(-3px); box-shadow:0 10px 25px rgba(0,0,0,0.25);}
.btn-add { background: linear-gradient(90deg, #4CAF50, #8BC34A); }
.btn-search { background: linear-gradient(90deg, #2196F3, #03A9F4); }
.btn-update { background: linear-gradient(90deg, #FF9800, #FFC107); }
.btn-remove { background: linear-gradient(90deg, #F44336, #E91E63); }

/* ======================================= */
/* Future Features Section                  */
/* ======================================= */
.future-section {
    padding: 80px 20px;
    background: #ffffff;
}
.future-section h2 {
    text-align: center;
    font-weight: 700;
    margin-bottom: 50px;
    font-size: clamp(2rem, 4vw, 3rem);
}
.future-cards .card {
    border-radius: 1.2rem;
    padding: 30px;
    box-shadow: var(--card-shadow);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
}
.future-cards .card:hover{
    transform: translateY(-10px);
    box-shadow: var(--hover-shadow);
}

/* ======================================= */
/* Footer (Expanded)                        */
/* ======================================= */
footer {
    background-color: #1a1a2e;
    color: #adb5bd;
    padding: 60px 0 30px;
    border-top: 5px solid var(--secondary-color);
}
.footer-container { max-width: 1200px; margin:auto; display:flex; flex-wrap:wrap; gap:40px; justify-content:space-between;}
.footer-section { flex:1; min-width:200px;}
.footer-section h5 { color:#fff; margin-bottom:20px; }
.footer-section ul { list-style:none; padding:0; }
.footer-section ul li { margin-bottom:10px; }
.footer-section ul li a { color:#adb5bd; text-decoration:none; transition:0.3s;}
.footer-section ul li a:hover{ color: var(--accent-color);}
.footer-bottom { text-align:center; margin-top:40px; color:#6c757d;}
.footer-icon{ color:#fff; margin:0 10px; font-size:1.5rem; transition: color 0.3s, transform 0.3s; }
.footer-icon:hover{ color: var(--accent-color); transform:translateY(-3px) scale(1.1); }

/* Animations */
@keyframes floatLogo{0%{transform:translateY(0) rotateZ(0deg);}100%{transform:translateY(-10px) rotateZ(3deg);}}
@keyframes floatShape{0%{transform:translateY(0px) translateX(0px) rotate(0deg);}50%{transform:translateY(-20px) translateX(10px) rotate(15deg);}100%{transform:translateY(0px) translateX(0px) rotate(0deg);}}
@keyframes gradientShift{0%{background-position:0% 50%;}50%{background-position:100% 50%;}100%{background-position:0% 50%;}}
@keyframes fadeInDown{from{opacity:0;transform:translateY(-40px);}to{opacity:1;transform:translateY(0);}}
@keyframes fadeInUp{from{opacity:0;transform:translateY(40px);}to{opacity:1;transform:translateY(0);}}
</style>
</head>
<body>

<jsp:include page="Navbar.jsp"/>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-bg"></div>
    <div class="hero-overlay"></div>
    <div class="floating-shape shape1"></div>
    <div class="floating-shape shape2"></div>
    <div class="floating-shape shape3"></div>
    <div class="container content">
        <h1 class="animate__animated animate__fadeInDown">Empower Your Team. Simplify Management.</h1>
        <p class="lead animate__animated animate__fadeInUp animate__delay-1s">
            The futuristic platform for seamless employee lifecycle management—from onboarding to offboarding.
        </p>
        <div class="company-logos animate__animated animate__fadeInUp animate__delay-2s">
            <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg" alt="Google" />
            <img src="https://upload.wikimedia.org/wikipedia/commons/4/44/Microsoft_logo.svg" alt="Microsoft" />
            <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/IBM_logo.svg" alt="IBM" />
        </div>
    </div>
</section>

<!-- Action Cards -->
<section class="container action-cards">
    <div class="row g-4 text-center justify-content-center">
        <div class="col-lg-3 col-md-6 animate__animated animate__fadeInUp animate__delay-1s">
            <div class="card h-100">
                <div class="card-body">
                    <i class="fas fa-user-plus card-icon"></i>
                    <h5 class="card-title">Add New Employee</h5>
                    <p class="card-text text-muted">Quickly onboard new staff members with ease.</p>
                    <a href="./add" class="btn btn-modern btn-add w-100 mt-3">Add</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 animate__animated animate__fadeInUp animate__delay-1-5s">
            <div class="card h-100">
                <div class="card-body">
                    <i class="fas fa-search card-icon"></i>
                    <h5 class="card-title">Search Directory</h5>
                    <p class="card-text text-muted">Locate any employee record instantly by ID or name.</p>
                    <a href="./search" class="btn btn-modern btn-search w-100 mt-3">Search</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 animate__animated animate__fadeInUp animate__delay-2s">
            <div class="card h-100">
                <div class="card-body">
                    <i class="fas fa-edit card-icon"></i>
                    <h5 class="card-title">Update Data</h5>
                    <p class="card-text text-muted">Keep all employee personal and role data current.</p>
                    <a href="./update" class="btn btn-modern btn-update w-100 mt-3">Update</a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 animate__animated animate__fadeInUp animate__delay-2-5s">
            <div class="card h-100">
                <div class="card-body">
                    <i class="fas fa-trash-alt card-icon"></i>
                    <h5 class="card-title">Terminate Record</h5>
                    <p class="card-text text-muted">Securely remove an employee record from the system.</p>
                    <a href="./employees" class="btn btn-modern btn-remove w-100 mt-3">Remove</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Future Features Section -->
<section class="future-section">
    <h2>Future Features & Roadmap</h2>
    <div class="row g-4 future-cards justify-content-center">
        <div class="col-lg-3 col-md-6">
            <div class="card text-center">
                <i class="fas fa-chart-line card-icon"></i>
                <h5 class="mt-3">Analytics Dashboard</h5>
                <p>Get real-time insights on employee performance & company growth.</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card text-center">
                <i class="fas fa-mobile-alt card-icon"></i>
                <h5 class="mt-3">Mobile App Integration</h5>
                <p>Manage your employees anytime, anywhere with our mobile platform.</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card text-center">
                <i class="fas fa-user-shield card-icon"></i>
                <h5 class="mt-3">Role-based Security</h5>
                <p>Advanced permissions to protect sensitive employee information.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h5>Employee Management</h5>
            <p>The ultimate solution for your company HR management needs. Seamlessly onboard, manage, and analyze your workforce.</p>
        </div>
        <div class="footer-section">
            <h5>Quick Links</h5>
            <ul>
                <li><a href="./add">Add Employee</a></li>
                <li><a href="./search">Search Employee</a></li>
                <li><a href="./update">Update Info</a></li>
                <li><a href="./employees">Remove Employee</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h5>Contact Info</h5>
            <p>Email: <a href="mailto:support@emssystem.com">support@emssystem.com</a></p>
            <p>Phone: +91 98765 43210</p>
            <div>
                <a href="#" target="_blank"><i class="fab fa-linkedin footer-icon"></i></a>
                <a href="#" target="_blank"><i class="fab fa-twitter footer-icon"></i></a>
                <a href="#" target="_blank"><i class="fab fa-facebook-f footer-icon"></i></a>
            </div>
        </div>
        <div class="footer-section">
            <h5>Subscribe</h5>
            <p>Get updates on new features and product roadmap.</p>
            <form class="d-flex flex-column gap-2">
                <input type="email" class="form-control" placeholder="Your email">
                <button class="btn btn-modern btn-add">Subscribe</button>
            </form>
        </div>
    </div>
    <div class="footer-bottom">
        &copy; 2025 Employee Management System. All rights reserved. 💼
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
