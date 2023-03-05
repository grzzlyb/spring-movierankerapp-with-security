<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	font-family: Andale Mono, monospace;
}

.h2 {
	font-size: 15px;
}

.failed {
	color: rgb(255, 0, 0);
}

.login-form {
	width: 340px;
	margin: 50px auto;
	font-size: 15px;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="login-form">
		<form:form
			action="${pageContext.request.contextPath}/authenticateTheUser"
			method="POST">
			<h2 class="text-center">Login</h2>
			<div class="form-group">
				<input type="text" class="form-control" name="username"
					placeholder="Username" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="password"
					placeholder="Password" required="required">
			</div>
			<c:if test="${param.error != null}">
				<div class="form-group" style="color: rgb(255, 0, 0);">
					Invalid username/password!</div>
			</c:if>

			<c:if test="${param.logout != null}">
				<div class="form-group" style="color: rgb(0, 204, 0);">You've
					been logged out!</div>
			</c:if>

			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Submit</button>
			</div>
		</form:form>
	</div>
</body>
</html>