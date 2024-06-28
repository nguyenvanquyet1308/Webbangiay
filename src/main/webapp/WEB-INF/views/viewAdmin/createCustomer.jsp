<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Khách Hàng Mới</title>
<style>
.createCustomer {
	margin-left: 350px;
	padding: 30px;
	width: 60%;
	border: 1px darkgrey solid;
	border-radius: 10px;
	width: 40%;
	margin: 0 auto;
}

body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>

	<%@ include file="../layout/sidebarAdmin.jsp"%>

	<div class="createCustomer">

		<h3 class="text-center">Thêm Khách Hàng Mới</h3>
		<form:form action="/admin/QLCustomer/create" modelAttribute="customer">

			<div class="form-group">
				<form:label path="name" class="form-label">Tên</form:label>
				<form:input path="name" class="form-control" />
				<form:errors path="name" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="email" class="form-label">Email</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="phone" class="form-label">Số điện thoại</form:label>
				<form:input path="phone" class="form-control" />
				<form:errors path="phone" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="password" class="form-label">Mật khẩu</form:label>
				<form:input path="password" type="password" class="form-control" />
				<form:errors path="password" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="confirmPassword" class="form-label">Xác nhận mật khẩu</form:label>
				<form:input path="confirmPassword" type="password"
					class="form-control" />
				<form:errors path="confirmPassword" cssStyle="color: red" />
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Tạo</button>
				<a type="button" href="/admin/QLCustomer" class="btn btn-dark">Đóng</a>
			</div>
		</form:form>
		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-3">${error}</div>
		</c:if>
	</div>

</body>
</html>
