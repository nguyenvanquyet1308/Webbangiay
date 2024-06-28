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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<style>
.QLOrders {
	margin-left: 200px;
	padding: 30px;
	width: 90%;
	font-size: 12px;
}
</style>
<body>
	<%@ include file="../layout/sidebarAdmin.jsp"%>
	<div class="QLOrders">
		<h2 class="text-center">Quản lý đơn hàng</h2>
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Người đặt hàng</th>
							<th>Ngày đặt hàng</th>
							<th>Tổng giá</th>
							<th>Trạng thái</th>
							<th>Điều chỉnh</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${itemOrders}">
							<tr>
								<td>${item.orderId}</td>
								<td>${item.customer.name}</td>
								<td>${item.orderDate}</td>
								<td>${item.amount}</td>
								<td>${item.status ? 'Đã giao' : 'Chưa giao'}</td>
								<td><c:choose>
										<c:when test="${item.status}">
											<!-- Nếu đã giao, hiển thị nút xóa đơn -->
											<a href="/admin/xoa/${item.orderId}" class="btn btn-dark" style="font-size: 10px;">Xóa đơn</a>
										</c:when>
										<c:otherwise>
											<!-- Nếu chưa giao, hiển thị nút xác nhận và xóa đơn -->
											<a href="/admin/xacnhan/${item.orderId}" class="btn btn-primary" style="font-size: 10px;">Xác
												nhận</a>
											<a href="/admin/xoa/${item.orderId}" class="btn btn-dark" style="font-size: 10px;">Xóa đơn</a>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
s
