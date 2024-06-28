<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
</head>
<style>
.btn-primary:hover {
	background-color: #0056b3;
}

.card-footer {
	background-color: #f8f9fa;
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
}

.card-footer a:hover {
	text-decoration: underline;
}

.container {
	border-radius: 10px;
}

.card {
	background-color: #EEEEEE;
}
</style>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header text-center">
						<h3>Đăng Ký</h3>
					</div>
					<div class="card-body">
						<form:form action="/dangKy" method="post"
							modelAttribute="customer">
							<div class="mb-3">
								<form:label path="name" class="form-label">Name</form:label>
								<form:input path="name" type="text" class="form-control"
									id="name" />
								<form:errors path="name" class="text-danger" />

							</div>
							<div class="mb-3">
								<form:label path="email" class="form-label">Email</form:label>
								<form:input path="email" class="form-control" id="email" />
								<form:errors path="email" class="text-danger" />

							</div>
							<div class="mb-3">
								<form:label path="phone" class="form-label">Phone</form:label>
								<form:input path="phone" type="text" class="form-control"
									id="phone" />
								<form:errors path="phone" class="text-danger" />

							</div>
							<div class="mb-3">
								<form:label path="password" class="form-label">Password</form:label>
								<form:input path="password" type="password" class="form-control"
									id="password" />
								<form:errors path="password" class="text-danger" />

							</div>
							<div class="mb-3">
								<form:label path="confirmPassword" class="form-label">Confirm Password</form:label>
								<form:input path="confirmPassword" type="password"
									class="form-control" id="confirmPassword" />
								<form:errors path="confirmPassword" class="text-danger" />

							</div>

							<button type="submit" class="btn btn-primary w-100">Đăng
								Ký</button>
						</form:form>
						<div>
							<c:if test="${not empty error}">
								<div class="alert alert-danger mt-3">${error}</div>
							</c:if>
							<c:if test="${not empty message}">
								<div class="alert alert-success mt-3">${message}</div>
							</c:if>
						</div>

					</div>
					<div class="card-footer text-center">
						<a href="/dangNhap">Đã có tài khoản? Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
