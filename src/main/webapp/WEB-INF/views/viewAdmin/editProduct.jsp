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
.user {
	margin-left: 350px;
	padding: 30px;
	width: 60%;
	border: 1px darkgrey solid;
	border-radius: 10px;
	width: 1%;
	margin: 0 auto;
}
</style>
<body>

	<%@ include file="../layout/sidebarAdmin.jsp"%>

	<!-- Modal body -->
	<div class="user mt-5 col-md-6">
		<h3 class="text-center">Edit Product</h3>
		<form:form action="/admin/QLProduct/update" modelAttribute="product">
			<div class="form-group">
				<form:label path="productId" class="form-label">Id</form:label>
				<form:input path="productId" class="form-control"  readonly="true"/>
				<form:errors path="productId" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="name" class="form-label">Name</form:label>
				<form:input path="name" class="form-control" />
				<form:errors path="name" cssStyle="color: red" />
			</div>
			<div class="form-group">
				<form:label path="image" class="form-label">Image</form:label>
				<form:input path="image" type="file"  class="form-control" />
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
				<form:label path="createDate" class="form-label">createDate</form:label>
				<form:input path="createDate" type="date" class="form-control" />
			</div>
				<div class="form-group">
			<form:label path="category" class="form-label">CategoryName</form:label>
				<form:select path="category" class = "form-control" >
					<c:forEach var="item" items="${showCbxCategory}">
						<form:option value="${item.categoryId}">${item.name}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="form-group">
				<form:label path="status" class="form-label">status</form:label>
				<br>
				<form:radiobutton path="status" value="true" />
				True
				<form:radiobutton path="status" value="false" />
				False
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" formaction="/admin/QLProduct/update"
					class="btn btn-primary">Update</button>
				<a href="/admin/QLProduct" class="btn btn-danger"> Close</a>

			</div>
		</form:form>
	</div>




</body>
</html>