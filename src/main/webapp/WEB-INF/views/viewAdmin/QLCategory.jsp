<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.Product {
	margin-left: 250px;
	padding: 30px;
	width: 70%;
}
</style>
<body>
	<%@ include file="../layout/sidebarAdmin.jsp"%>
	<div class="Product">

		<div class="card">
			<div class="card-header">
				<h3 style="text-align: center">Category Form</h3>
			</div>
			<div class="card-body">
				<form:form action="/admin/category/index"
					modelAttribute="itemCategory" class="form">

					<div class="form-group">
						<form:label path="categoryId" class="form-label">Category Id</form:label>
						<form:input path="categoryId" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<form:label path="name" class="form-label">Category Name</form:label>
						<form:input path="name" placeholder="Category Name?"
							class="form-control" />
							<form:errors path="name" cssStyle="color: red"/>
					</div>
					<hr>
					<div class="form-group">
						<button type="submit" formaction="/admin/category/create"
							class="btn btn-primary">Create</button>
						<button type="submit" formaction="/admin/category/update"
							class="btn btn-warning">Update</button>
						<a href="/admin/category/index" class="btn btn-secondary">Reset</a>
					</div>
				</form:form>
			</div>
		</div>
		<div class="container mt-5">

			<div class="card">
				<div class="card-header">
					<h3>Category List</h3>
				</div>
				<div class="card-body">
					<table class="table table-striped table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${itemCategorys}">
								<tr>
									<td>${item.categoryId}</td>
									<td>${item.name}</td>
									<td><a href="/admin/category/edit/${item.categoryId}"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="/admin/category/delete/${item.categoryId}"  onclick="return confirm('Are you sure!')"
										class="btn btn-danger">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>

	</div>
</body>
</html>