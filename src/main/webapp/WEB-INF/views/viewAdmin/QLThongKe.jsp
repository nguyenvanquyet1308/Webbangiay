<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style>
.thongke {
	height: 150px;
	background-color: #f0f0f0;
	border: 1px solid #ccc;
	text-align: center;
}

p {
	margin: 10px;
	font-size: 13px;
	color: #686D76;
}

strong {
	font-size: 35px;
}

.QLThongKe {
	margin-left: 250px;
	padding: 30px;
	width: 90%;
}
</style>
</head>

<body>
	<%@ include file="../layout/sidebarAdmin.jsp"%>


	<div class="QLThongKe mt-5">
		<div class="row">
			<div class="col-sm-4">
				<div class="thongke">
					<p class="">Tổng người dùng</p>
					<Strong>${countCustomer}</Strong>
				</div>
			</div>
			<div class="col-sm-4">

				<div class="thongke">
					<p class="">Tổng Đơn Hàng</p>
					<Strong>${countOrders}</Strong>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thongke">
					<div class="row">
						<div class="col-sm-6">
							<p>Tổng đơn đã giao</p>
							<strong>${countDaGiao}</strong>
						</div>
						<div class="col-sm-6">
							<p>Tổng đơn chưa giao</p>
							<Strong>${countChuaGiao}</Strong>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="/admin/QLThongKe" method="post">
		<div class="row mt-2">
			<div class="col-sm-8">
				<div class="thongke">
					<label for="startDate">Từ ngày:</label> <input type="date"
						id="startDate" name="startDate"> <label for="endDate">Đến
						ngày:</label> <input type="date" id="endDate" name="endDate">
					<button type="submit" class="btn btn-success">Submit</button>
					<br> <br> <strong>Doanh thu: ${sumAmount}</strong>
				</div>
			</div>
			<div class="col-sm-4">

			

			</div>
		</div>
		</form>
	</div>
	</div>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>