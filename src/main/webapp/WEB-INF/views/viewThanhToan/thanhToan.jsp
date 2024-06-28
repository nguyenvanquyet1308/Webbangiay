<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thanh Toán</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../css/sanpham.css">
<style>
body {
	background-color: #f8f9fa;
	padding: 20px;
}

.container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	font-size: 12px;
}

.form-group label {
	font-weight: bold;
}

.payment-methods img {
	width: 30px;
	height: 30px;
}

.btn-payment {
	background-color: #dc3545;
	color: white;
	font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h4>Thông tin liên hệ giao hàng</h4>
				<form action="/thanhtoan" method="post">
					<div class="form-group">
						<label for="name">Họ và tên *</label> <input type="text"
							value="${customer.name}" class="form-control" id="name" required>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" placeholder="Không bắt buộc"
							value="${customer.email}">
					</div>
					<div class="form-group">
						<label for="phone">Số điện thoại *</label> <input type="tel"
							class="form-control" id="phone" required
							value="${customer.phone }">
					</div>

					<h4>Địa chỉ giao hàng</h4>
					<div class="form-group">
						<label for="city">Chọn tỉnh thành *</label> <select
							class="form-control" id="city">
							<option>--- Chọn tỉnh thành ---</option>
							<!-- Add options here -->
						</select>
					</div>
					<div class="form-group">
						<label for="district">Chọn quận huyện *</label> <select
							class="form-control" id="district">
							<option>Bạn chưa chọn tỉnh thành</option>
							<!-- Add options here -->
						</select>
					</div>
					<div class="form-group">
						<label for="ward">Tên phường/Xã *</label> <input type="text"
							class="form-control" id="ward">
					</div>
					<div class="form-group">
						<label for="address">Số nhà, tên đường *</label> <input
							type="text" class="form-control" id="address">
					</div>
					<div class="form-group">
						<label for="note">Ghi chú</label>
						<textarea class="form-control" id="note" rows="3"></textarea>
					</div>

					<h4>Hình thức thanh toán</h4>
					<div class="payment-methods">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMethod"
								id="cod" value="cod" checked> <label
								class="form-check-label" for="cod"> <i
								class="fa-solid fa-wallet"></i> COD <small class="text-muted">Thanh
									toán khi nhận hàng</small>
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="paymentMethod"
								id="cash" value="cash"> <label class="form-check-label"
								for="cash"> <i class="fa-solid fa-money-bill-1-wave"></i>
								Tiền mặt <small class="text-muted">Chỉ áp dụng khi mua
									hàng tại shop</small>
							</label>
						</div>
					</div>
					<button type="submit" class="btn btn-payment btn-block mt-4">THANH
						TOÁN ${sessionScope.cart.total} ₫ (UNDEFINED)</button>
						
				</form>
				
			</div>
			<div class="col-md-6">
				<form action="">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>SubTotal</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${sessionScope.cart.allItems}">
								<tr>
									<td>${item.product.name}</td>
									<td><fmt:formatNumber value="${item.product.unitPrice}"
											type="currency" /></td>
									<td>
										<form action="/thanhtoan/update" method="post">
											<input type="hidden" value="${item.product.productId}"
												name="id"> <input type="number" min="1"
												value="${item.quantity}" name="qty" class=""
												style="width: 50px;">
											<button type="submit" class="btn "
												style="font-size: 8px; background-color: blue; color: white;">Update</button>
										</form>
									</td>
									<td><fmt:formatNumber value="${item.subTotal}"
											type="currency" /></td>
									<td>
										<form action="/thanhtoan/remove" method="post">
											<input type="hidden" value="${item.product.productId}"
												name="id">
											<button type="submit" class="btn btn-danger"
												style="font-size: 8px;">Remove</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</form>
			</div>
		</div>
		<br> <br>
		<table class="table table-hover">
			<h4>Đơn hàng của bạn</h4>
			<thead>
				<tr>
					<th>Id</th>
					<th>Ngày tạo đơn</th>
					<th>Người đặt</th>
					<th>Tổng giá</th>
					<th>Trạng thái</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${itemOrders}" >
					<tr>
						<td>${item.orderId}</td>
						<td>${item.orderDate}</td>
						<td>${item.customer.name}</td>
						<td>${item.amount} ₫</td>
						<td>${item.status == true ? 'Đã giao hàng thành công' : 'Đang chuẩn bị hàng'}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>



	<%@ include file="../layout/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/bff65d775c.js"
		crossorigin="anonymous"></script>
</body>
</html>
