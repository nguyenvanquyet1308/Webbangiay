<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<!-- Thêm link Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.table {
	font-size: 14px;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<c:if test="${not empty sessionScope.cart}">
					<h2>
						Total:
						<fmt:formatNumber value="${sessionScope.cart.total}"
							type="currency" />
					</h2>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
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
									<td>${item.product.productId}</td>
									<td>${item.product.name}</td>
									<td><fmt:formatNumber value="${item.product.unitPrice}"
											type="currency" /></td>
									<td>
										<form action="/gioHang/update" method="post">
											<input type="hidden" value="${item.product.productId}"
												name="id"> <input type="number" min="1"
												value="${item.quantity}" name="qty" class=""
												style="width: 50px;">
											<button type="submit" class="btn "
												style="font-size: 12px; background-color: blue; color: white;">Update</button>
										</form>
									</td>
									<td><fmt:formatNumber value="${item.subTotal}"
											type="currency" /></td>
									<td>
										<form action="/gioHang/remove" method="post">
											<input type="hidden" value="${item.product.productId}"
												name="id">
											<button type="submit" class="btn btn-danger">Remove</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<a href="/thanhtoan">	<button class="btn btn-primary "style="margin-left: 705px">Thanh toán</button></a>

				</c:if>
				<c:if test="${empty sessionScope.cart}">
					<p>Empty Cart</p>
					<a href="${pageContext.request.contextPath}/" class="btn btn-info">Go
						back</a>
				</c:if>

			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>
