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
<style>
.createProduct {
	margin-left: 350px;
	padding: 30px;
	width: 60%;
	border: 1px darkgrey solid;
	border-radius: 10px;
	width: 40%;
	margin: 0 auto;
}

body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<body>

	<%@ include file="../layout/sidebarAdmin.jsp"%>

	<div class="createProduct">

		<h3 class="text-center">Add New Product</h3>
		<form:form action="/admin/QLProduct/create" modelAttribute="product">


			<div class="form-group">
				<form:label path="name" class="form-label">Name</form:label>
				<form:input path="name" class="form-control" />
				<form:errors path="name" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="image" class="form-label">Image</form:label>
				<form:input path="image" type="file" class="form-control" />
				<form:errors path="image" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="quantity" class="form-label">Quantity</form:label>
				<form:input path="quantity" class="form-control" />
				<form:errors path="quantity" cssStyle="color: red" />
			</div>



			<div class="form-group">
				<form:label path="discount" class="form-label">Discount</form:label>
				<form:input path="discount" class="form-control" />
				<form:errors path="discount" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="unitPrice" class="form-label">unitPrice</form:label>
				<form:input path="unitPrice" class="form-control" />
				<form:errors path="unitPrice" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="description" class="form-label">Description</form:label>
				<form:textarea path="description" class="form-control"></form:textarea>
				<form:errors path="description" cssStyle="color: red" />
			</div>
			<div class="form-group">
			<form:label path="category" class="form-label">CategoryName</form:label>
				<form:select path="category" class = "form-control" >
					<c:forEach var="item" items="${showCbxCategory}">
						<form:option value="${item.categoryId}">${item.name}</form:option>
					</c:forEach>
				</form:select>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" formaction="/admin/QLProduct/create"
					class="btn btn-primary">Create</button>
				<button type="button" class="btn btn-dark">Close</button>
			</div>
		</form:form>
	</div>


</body>
</html>