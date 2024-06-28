<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	display: flex;
	background-color: #F7F9F2;
}

.sidebar {
	width: 200px; /* Độ rộng của sidebar */
	background-color: #f2f2f2; /* Màu nền của sidebar */
	padding: 20px; /* Khoảng cách giữa nội dung và viền của sidebar */
	box-sizing: border-box;
	/* Đảm bảo rằng padding được tính vào kích thước */
	position: fixed;
	height: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	width: 200px;
	background-color: #f2f2f2;
	padding: 20px;
	font-size: 12px;
}

.sidebar a {
	color: black;
	padding: 1rem;
	text-decoration: none;
	display: block;
}

.sidebar a:hover {
	background-color: #219C90;
}

.content {
	margin-left: 250px;
	padding: 1rem;
}

.logout {
	position: absolute;
	bottom: 1rem;
	width: 100%;
}
</style>
</head>
<body>
	<!-- sidebar.html -->
	<div class="sidebar">
		<a href="/admin/category/index" class="nav-link"><i class="fa-solid fa-print"></i> Quản lý Loại</a>
		<a href="/admin/QLCustomer" class="nav-link"> <i class="fa-solid fa-user"></i> Quản lý Người Dùng</a>
		<a href="/admin/QLProduct" class="nav-link"><i class="fa-brands fa-shopify"></i> Quản lý Sản Phẩm</a> 
		<a href="/admin/QLOrders" class="nav-link"> <i class="fa-solid fa-cart-shopping"></i> Quản lý Đơn Hàng</a>
		<a href="/admin/QLThongKe" class="nav-link"><i class="fa-solid fa-chart-simple"></i> Thống kê</a> 
		<a href="/dangNhap" class="nav-link logout"> <i class="fa-solid fa-right-from-bracket"></i> Logout</a>

	</div>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/bff65d775c.js"
		crossorigin="anonymous"></script>
</body>
</html>
