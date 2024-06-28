<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer Information</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<style>
body {
    background-color: #f8f9fa;
}

.card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    transition: 0.3s;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card-header {
    background-color: #007bff;
    color: white;
}

.btn-primary {
    background-color: #007bff;
    border: none;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.list-group-item.active {
    background-color: #ffc107;
    border-color: #ffc107;
}
</style>
</head>
<body>
    <%@ include file="../layout/header.jsp"%>

    <div class="container mt-5">
        <div class="row">
            <%@ include file="sidebarHoSo.jsp"%>

            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Thông tin tài khoản</h4>
                    </div>
                    <div class="card-body">
                        <form:form action="/doimatkhau" method="post" modelAttribute="customer">
                            <div class="form-group">
                                <label for="customerId">Customer Id</label>
                                <form:input path="customerId" class="form-control" readonly="true" />
                            </div>
                            <div class="form-group">
                                <label for="displayName">Tên hiển thị *</label>
                                <form:input path="name" class="form-control" placeholder="Tên hiển thị" />
                                <small class="form-text text-muted">Tên này sẽ hiển thị trong trang Tài khoản và phần Đánh giá sản phẩm</small>
                            </div>
                            <div class="form-group">
                                <label for="email">Địa chỉ email *</label>
                                <form:input path="email" class="form-control" readonly="true" placeholder="Địa chỉ email" />
                            </div>
                            <div class="card mt-4">
                                <div class="card-header">Thay đổi mật khẩu</div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="currentPassword">Mật khẩu hiện tại (bỏ trống nếu không đổi)</label>
                                        <input name="password" class="form-control" placeholder="Mật khẩu hiện tại" >
                                    </div>
                                    <div class="form-group">
                                        <label for="newPassword">Mật khẩu mới (bỏ trống nếu không đổi)</label>
                                        <input name="newPassword" class="form-control" placeholder="Mật khẩu mới" />
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                                       <input name="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu mới" />
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-3">Cập nhật tài khoản</button>
                                </div>
                            </div>
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
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../layout/footer.jsp"%>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Custom JavaScript -->
    <script src="script.js"></script>
</body>
</html>
