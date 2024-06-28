<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="..." crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/style.css">

<body>

	<div id="wrapper">
		<%@ include file="../layout/header.jsp"%>
		<div id="banner">
			<div class="box-left">
				<h2>
					<span>SẢN PHẨM HOT</span> <br> <span>NEW READ</span>
				</h2>
				<p>Xu hướng những sản phẩm giày hot nhất hiện nay đang chờ đón
					bạn tại cửa hành</p>
				<a href="/sanpham"><button>Mua ngay</button></a>
			</div>
			<div class="box-right">
				<img src="image/3soc.jpg" alt=""> <img src="image/3soc1.jpg"
					alt=""> <img src="image/gucci.jpg" alt="">
			</div>
			<div class="to-bottom">
				<a href=""> <img src="assets/to_bottom.png" alt="">
				</a>
			</div>
		</div>
		<div class="row row-cols-1 row-cols-md-3 g-5 py-5">
	
			<c:forEach var="item" items="${page.content}">
				<div class="col">
					<div class="card">

						<img alt="" src="/images/${item.image}" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title text-center mt-2">${item.name}</h5>
						</div>
						<div class="mb-5 d-flex justify-content-around">
							<h3 class="unitPrice">${item.unitPrice}₫</h3>
							<div class="icon-cart">
								<a class="show-modal" href="${item.productId}"> <img class="imgageCart"
									src="assets/carticon.png" alt="" height="60px" width="60px">
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach> 
			<div style="margin: 0 auto">
			<nav aria-label="Page navigation" style="margin: 0 auto">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="?p=0">First</a></li>
					<li class="page-item"><a class="page-link"
						href="?p=${page.number-1}">Previous</a></li>
					<c:forEach var="i" begin="0" end="${page.totalPages-1}">
						<li
							class="page-item <c:if test="${i eq page.number}">active</c:if>">
							<a class="page-link" href="?p=${i}">${i+1}</a>
						</li>
					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="?p=${page.number+1}">Next</a></li>
					<li class="page-item"><a class="page-link"
						href="?p=${page.totalPages-1}">Last</a></li>
				</ul>
			</nav>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<span id="name"> </span>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<form:form action="/gioHang/add" method="post">
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6">
										<img src="" id="productImage" height="120px" width="180px"
											class="img-fluid" alt="Hình ảnh giày">
									</div>
									<div class="col-md-6">
										<h5>Size:</h5>
										<select class="form-select mb-3">
											<option value="38">size 38</option>
											<option value="39">size 39</option>
											<option value="40">size 40</option>
											<option value="41">size 41</option>
											<option value="42">size 42</option>
										</select>
										<h5>Số lượng:</h5>
										<input type="number" id="quantity" name="quantity"
											class="form-control mb-3" value="1" min="1" required>

										<div class="form-group">
											<label for="unitPrice">Giá bán: </label> <br> <span
												id="unitPrice" style="color: red;"> </span>
										</div>
									</div>
									<div>
										<a style="color: blue;">Xem chi tiết sản phẩm</a>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<input type="hidden" id="idProduct" name="id">
								<button type="submit" class="addCart" style="font-size: 14px" >Thêm vào giỏ hàng</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	

	</div>
	<div id="saleoff">
		<div class="box-left">
			<h1>
				<span>GIẢM GIÁ LÊN ĐẾN</span> <span>45%</span>
			</h1>
		</div>
		<div class="box-right"></div>
	</div>


	<%@ include file="../layout/footer.jsp"%>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


	<script type="text/javascript">
		$(document).ready(
				function() {
					$('.show-modal').on(
							'click',
							function(event) {
								event.preventDefault();

								var href = $(this).attr('href');

								$.get(href, function(Product, status) {
									$('#idProduct').val(Product.productId);

									$('#name').text(Product.name);
									$('#productImage').attr('src',
											"/getimgae/" + Product.image);
									$('#unitPrice').text(
											Product.unitPrice + " đ");

									$('#IdCuaProduct').attr('href',
											"/gioHang/" + Product.productId);
								});

								$('#exampleModal').modal('show');
							});
				});
	</script>

</body>
</html>
