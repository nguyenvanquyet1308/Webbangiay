<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Email</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
.container {
    margin-top: 100px;
    background: #D8EFD3;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.container:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.form-group label {
    font-weight: bold;
}

.btn {
    margin-left: 150px;
}
</style>
</head>
<body>
    <%@ include file="../layout/header.jsp"%>

    <form action="/checkEmail" method="post">
        <div class="container mt-5 col-md-4">
            <div class="form-group">
                <label for="MaOTP">Hãy nhập mã OTP được gửi đến gmail</label>
                <input name="MaOTP" type="number" class="form-control" id="MaOTP" required>
            </div>
            <div>
                <button class="btn btn-success" type="submit">Submit</button>
            </div>
            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
            </c:if>
        </div>
    </form>
    <%@ include file="../layout/footer.jsp"%>

</body>
</html>
