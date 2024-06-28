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
			<a href="/admin/QLCustomer/cr"><button class="btn btn-success" >Create New User</button></a>
		</div>
		<h3 class="text-center">User Management</h3>
		<form:form action="/admin/QLCustomer" modelAttribute="customer">
			<table class="table table-bordered">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Password</th>
						<th>Phone</th>
						<th>Registered_date</th>
						<th>Admin</th>
						<th>Actions</th>

					</tr>
				</thead>

				<tbody>
					<c:forEach var="item" items="${itemCustomer}">
						<tr>
							<td>${item.customerId}</td>
							<td>${item.name}</td>
							<td>${item.email}</td>
							<td>${item.password}</td>
							<td>${item.phone}</td>
							<td><fmt:formatDate value="${item.registeredDate}"
									pattern="yyyy/MM/dd" /></td>

							<td>${item.admin}</td>
							<td>
								<button class="btn btn-primary" style="font-size: 10px;"
									formaction="/admin/QLCustomer/edit/${item.customerId}">Edit</button>

								<a class="btn btn-danger btn-sm" style="font-size: 10px;"
								href="/admin/QLCustomer/delete/${item.customerId}"  onclick="return confirm('Are you sure!')">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			
		</form:form>

	</div>




</body>
