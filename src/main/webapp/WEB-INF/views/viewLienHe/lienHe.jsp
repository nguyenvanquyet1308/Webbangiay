<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

#wrapper-about {
	margin-top: 50px;
}

.card-title {
	font-weight: bold;
	font-size: 1.5rem;
}

.card-text i {
	color: #007bff;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div class="container" id="wrapper-about">
		<div class="card mt-4">
			<div class="card-body">
				<h5 class="card-title text-center">LIÊN HỆ VỚI CHÚNG TÔI</h5>
				<p class="card-text">
				<div>
					<p>
						<i class="fas fa-phone me-2"></i> Hotline : 0345204733
					</p>
					<p>
						<i class="fas fa-map-marker-alt me-2"></i> Địa chỉ : 137 Nguyễn
						Thị Thập - Hòa Minh - Liên Chiểu - TP.Đà Nẵng
					</p>
					<p>
						<i class="fas fa-clock me-2"></i> Giờ làm việc : 7h - 22h, T2 - T7
					</p>
					<p>
						<i class="fas fa-envelope me-2"></i> Email :
						Nguyenquyet2017zz@gmail.com
					</p>
				</div>
				</p>
				<div class="text-center">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3833.8018881525713!2d108.1699479!3d16.075767099999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218e6e72e66f5%3A0x46619a0e2d55370a!2zMTM3IE5ndXnhu4VuIFRo4buLIFRo4bqtcCwgVGhhbmggS2jDqiBUw6J5LCBMacOqbiBDaGnhu4N1LCDEkMOgIE7hurVuZw!5e0!3m2!1sen!2s!4v1708437412035!5m2!1sen!2s"
						width="1000" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../layout/footer.jsp"%>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>