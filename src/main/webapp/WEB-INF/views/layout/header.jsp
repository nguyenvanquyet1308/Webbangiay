<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="../css/style.css">
<form:form modelAttribute="customer" >
<c:choose>
	<c:when test="${sessionScope.user.admin == true}">
		<div class="header">
			<div id="header">
				<a href="/" class="logo"> <img
					src="${pageContext.request.contextPath}/image/logogiay1.jpg" alt="">
				</a>
				<div id="menu">
					<div class="item">
						<a href="/">Trang chủ</a>
					</div>
					<div class="item">
						<a href="/sanpham">Sản phẩm</a>
					</div>
					<div class="item">
						<a href="">Blog</a>
					</div>
					<div class="item">
						<a href="/lienHe">Liên hệ</a>
					</div>
					<div class="item">
						<a href="/dangNhap">Đăng Nhập</a>
					</div>
					<div class="item">

						<a href="/dangKy">Đăng Ký</a>
					</div>
					<div class="item">

						<a href="/admin">Admin</a>
					</div>
				</div>
				<div id="actions">
					<div class="item">
							<img src="${pageContext.request.contextPath}/assets/user.png"
								alt="" id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item text-body "
									href="/hoSo/${customer.customerId}">Hồ sơ</a></li>
								<li><a class="dropdown-item text-body "
									href="/dangXuat">Đăng Xuất</a></li>
									<li><a class="dropdown-item text-body "
									href="/thanhtoan">Đơn hàng</a></li>
							</ul>
				
					</div>
					<div class="item">
						<a href="/gioHang"> <img
							src="${pageContext.request.contextPath}/assets/cart.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="header">
			<div id="header">
				<a href="/" class="logo"> <img
					src="${pageContext.request.contextPath}/image/logogiay1.jpg" alt="">
				</a>
				<div id="menu">
					<div class="item">
						<a href="/">Trang chủ</a>
					</div>
					<div class="item">
						<a href="/sanpham">Sản phẩm</a>
					</div>
					<div class="item">
						<a href="">Blog</a>
					</div>
					<div class="item">
						<a href="/lienHe">Liên hệ</a>
					</div>
					<div class="item">
						<a href="/dangNhap">Đăng Nhập</a>
					</div>
					<div class="item">
						<a href="/dangKy">Đăng Ký</a>
					</div>

				</div>
				<div id="actions">
					<div class="item">
							<img src="${pageContext.request.contextPath}/assets/user.png"
								alt="" id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item text-body "
									href="/hoSo/${customer.customerId}">Hồ sơ</a></li>
								<li><a class="dropdown-item text-body "
									href="/dangXuat">Đăng Xuất</a></li>
									<li><a class="dropdown-item text-body "
									href="/thanhtoan">Đơn hàng</a></li>
							</ul>
				
					</div>

					<div class="item">
						<a href="/gioHang"> <img
							src="${pageContext.request.contextPath}/assets/cart.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
</form:form>


