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
.row {
	padding: 20px;
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
		<h1 class="text-center">Đơn hàng của bạn</h1>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Người đặt hàng</th>
							<th>Tên sản phẩm</th>
							<th>Số lượng</th>
							<th>Ngày đặt hàng</th>
							<th>giá sản phẩm</th>
							<th>Tổng giá</th>
							<th>Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${itemOrderDetail}">
							<tr>
								<td>${item.order.orderId}</td>
								<td>${item.order.customer.name}</td>
								<td>${item.product.name }</td>
								<td>${item.quantity}</td>
								<td>${item.order.orderDate}</td>
								<td>${item.product.unitPrice }</td>
								<td>${item.order.amount}</td>
								<td>${item.order.status == true ? 'Đã giao' : 'Chưa giao'}</td>

							</tr>


						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
s
