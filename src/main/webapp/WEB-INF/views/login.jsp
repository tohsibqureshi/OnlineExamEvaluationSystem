<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/loginstyles.css">
<title>Login Form</title>
</head>
<body style="background-image: url('img/bg.jpg')">
	${msg}
	<div class="login-wrapper">
		<form action="/login" class="form" method="post">
			<img src="img/avatar.png" alt="">
			<h2>Login</h2>
			<div class="input-group">
				<input type="email" name="email" id="loginUser" required> <label
					for="loginUser">Email</label>
			</div>
			<div class="input-group">
				<input type="password" name="password" id="loginPassword" required>
				<label for="loginPassword">Password</label>
			</div>
			<c:if test="${param.error ne null}">
				<div class="alert-danger">Invalid email and password.</div>
			</c:if>
			<c:if test="${param.logout ne null}">
				<div class="alert-normal">You have been logged out.</div>
			</c:if>

			 <input type="submit" value="Login"
				class="submit-btn"> <a href="#forgot-pw" class="forgot-pw">Forgot
				Password?</a>

		</form>

		<div id="forgot-pw" style="background-image: url('img/bg.jpg');">
			<form action="#" class="form">
				<a href="#" class="close">&times;</a>
				<h2>Reset Password</h2>
				<div class="input-group">
					<input type="email" name="email" id="email" required> <label
						for="email">Email</label>
				</div>
				<input type="submit" value="Submit" class="submit-btn">
			</form>
		</div>
	</div>
</body>
</html>