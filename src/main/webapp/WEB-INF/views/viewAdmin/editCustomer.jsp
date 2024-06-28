<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<style>
.user {
    margin-left: 350px;
    padding: 30px;
    width: 60%;
    border: 1px darkgrey solid;
    border-radius: 10px;
    width: 40%;
    margin: 0 auto;
}
</style>
</head>
<body>
    <%@ include file="../layout/sidebarAdmin.jsp"%>
    <div class="user mt-5 col-md-6">
        <h3 class="text-center">Edit User</h3>
        <form:form action="/admin/QLCustomer/update" modelAttribute="customer">
            <div class="form-group">
                <form:label path="customerId" class="form-label">Id</form:label>
                <form:input path="customerId" class="form-control" readonly="true" />
                <form:errors path="customerId" cssStyle="color: red" />
            </div>
            <div class="form-group">
                <form:label path="name" class="form-label">Name</form:label>
                <form:input path="name" class="form-control" />
                <form:errors path="name" cssStyle="color: red" />
            </div>
            <div class="form-group">
                <form:label path="email" class="form-label">Email</form:label>
                <form:input path="email" class="form-control" />
                <form:errors path="email" cssStyle="color: red" />
            </div>
            <div class="form-group">
                <form:label path="phone" class="form-label">Phone</form:label>
                <form:input path="phone" class="form-control" />
                <form:errors path="phone" cssStyle="color: red" />
            </div>
            <div class="form-group">
                <form:label path="password" class="form-label">Password</form:label>
                <form:input path="password" type="password" class="form-control" />
                <form:errors path="password" cssStyle="color: red" />
            </div>
            <div class="form-group">
                <form:label path="registeredDate" class="form-label">Registered Date</form:label>
                <form:input path="registeredDate" type="date" class="form-control" />
            </div>
            <div class="form-group">
                <form:label path="admin" class="form-label">Status</form:label>
                <br>
                <form:radiobutton path="admin" value="true" /> True
                <form:radiobutton path="admin" value="false" /> False
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Update</button>
                <a href="/admin/QLCustomer" class="btn btn-danger">Close</a>
            </div>
        </form:form>
    </div>
</body>
</html>
