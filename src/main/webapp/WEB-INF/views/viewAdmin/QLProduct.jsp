<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.user {
	margin-left: 200px;
	padding: 30px;
	width: 90%;
}

tr {
	font-size: 12px;
}
</style>
<body>
	<%@ include file="../layout/sidebarAdmin.jsp"%>

	<div class="user mt-5">
		<div class="text-start ">
			<a href="/admin/QLProduct/cr"><button class="btn btn-success">Create
					Product</button></a>

		</div>
		
		<h3 class="text-center">Product Management</h3>
		<form:form action="/admin/QLProduct" modelAttribute="product">
		<div class="col-md-2">
			<form:select path="category" class="form-control">
				<c:forEach var="item" items="${showCbxCategory}">
					<form:option value="${item.categoryId}">${item.name}</form:option>
				</c:forEach>
			</form:select> <br>
			<div><button class="btn btn-primary " style="font-size: 10px;">Submit</button>
			<a style="margin: 10px;" href="/admin/QLProduct">show all</a>
			</div>
		
			
		</div>
			<table class="table table-bordered mt-2">
				<thead class="table-dark">
					<tr>
						<th>Id</th>	
						<th>Name</th>
						<th>Quantity</th>
						<th>unitPrice</th>
						<th>image</th>
						<th>description</th>
						<th>discount</th>
						<th>createDate</th>
						<th>status</th>
						<th>category</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="item" items="${itemProduct}">
						<tr>
							<td>${item.productId}</td>
							<td>${item.name}</td>
							<td>${item.quantity}</td>
							<td>${item.unitPrice}</td>
							<td><img alt="" src="/getimgae/${item.image}" width="100px"
								height="100px"></td>
							<td>${item.description}</td>
							<td>${item.discount}</td>
							<td>${item.createDate}</td>
							<td>${item.status}</td>
							<td>${item.category.name}</td>


							<td>
								<button class="btn btn-primary" style="font-size: 10px;"
									formaction="/admin/QLProduct/edit/${item.productId}">Edit</button> <a
								class="btn btn-danger btn-sm" style="font-size: 10px;"
								href="/admin/QLProduct/delete/${item.productId}"  onclick="return confirm('Are you sure!')">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

		</form:form>

		<!-- The Modal -->

	</div>




</body>
