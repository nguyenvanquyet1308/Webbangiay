<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<style>
body {
	padding-top: 20px;
	margin-left: 50px;
}

.card {
	margin-top: 20px;
}

.btn-sm {
	margin-top: 5px;
}
</style>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
		<h1 class="text-center">Giỏ hàng của bạn</h1>
		<div class="row">
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Tên sản phẩm</th>
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${sessionScope.cart.allItems}">
							<form:form action="gioHang/update/${item.productId}"
								method="post">
								<tr>
									<th>${item.product.productId}</th>
									<td>${item.product.name}</td>
									<td>${item.product.unitPrice}</td>
									<td><input type="hidden" value="${item.product.productId}"
										name="id"> <input type="number" min="1"
										value="${item.quantity}" name="qty">
										<button type="submit">Update</button> <fmt:formatNumber
											value="${item.subTotal}" type="currency" /></td>
									<td>
										<form action="/gioHang/remove"
											method="post">
											<input type="hidden" value="${item.product.productId}"
												name="id">
											<button type="submit">Remove</button>
										</form>
									</td>
								</tr>
							</form:form>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Tổng cộng</h5>
						<p class="card-text">Tổng tiền: 550.000 VNĐ</p>
						<a href="#" class="btn btn-primary">Thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
s
