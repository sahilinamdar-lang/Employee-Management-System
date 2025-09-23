<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">
<style>
body, html {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	height: 100%;
}

.bg-section {
	background:
		url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1600&q=80')
		no-repeat center center/cover;
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

.form-card {
	position: relative;
	z-index: 1;
	background: rgba(255, 255, 255, 0.95);
	padding: 40px;
	border-radius: 20px;
	width: 100%;
	max-width: 600px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	animation: fadeInUp 1s ease;
}

.form-card h2 {
	color: #1d3557;
	font-weight: 700;
	margin-bottom: 25px;
	text-align: center;
}

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
	transition: border-color 0.3s, box-shadow 0.3s;
}

input:focus {
	outline: none;
	border-color: #457b9d;
	box-shadow: 0 0 8px rgba(69, 123, 157, 0.3);
}

.submit-btn {
	width: 100%;
	padding: 14px;
	background: #457b9d;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

.submit-btn:hover {
	background-color: #2a6f97;
	transform: translateY(-2px);
}

@
keyframes fadeInUp {
	from {opacity: 0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@media ( max-width :768px) {
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
			<h2>Update Employee</h2>
			<form action="${pageContext.request.contextPath}/update"
				method="post">
				<input type="hidden" name="id" value="${employee.id}">

				<div class="form-group">
					<label for="name">Full Name</label> <input type="text" id="name"
						name="name" value="${employee.name}" required>
				</div>

				<div class="form-group">
					<label for="email">Email Address</label> <input type="email"
						id="email" name="email" value="${employee.email}" required>
				</div>

				<div class="form-group">
					<label for="contact">Contact Number</label> <input type="tel"
						id="contact" name="contact" value="${employee.contact}" required>
				</div>

				<div class="form-group">
					<label for="designation">Designation</label> <input type="text"
						id="designation" name="designation"
						value="${employee.designation}" required>
				</div>

				<div class="form-group">
					<label for="salary">Salary</label> <input type="number" id="salary"
						name="salary" value="${employee.salary}" required>
				</div>

				<button type="submit" class="submit-btn">Update Employee</button>
			</form>
		</div>
	</section>

	<c:if test="${not empty msg}">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
			Swal.fire({
				icon : '${msg.contains("success") ? "success" : "error"}',
				title : '${msg}',
				showConfirmButton : false,
				timer : 2000
			});
		</script>
	</c:if>

</body>
</html>
