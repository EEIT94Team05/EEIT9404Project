<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/bootstrap.css'
	type="text/css" />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/signin.css'
	type="text/css" />

<title>Signin會員</title>
<!-- Bootstrap core CSS -->

<!-- <script src="../../assets/js/ie-emulation-modes-warning.js" -->
<!-- 	tppabs="http://bootstrap.css88.com/v3.3.1/assets/js/ie-emulation-modes-warning.js"></script> -->
</head>

<body>
	<div class="container">
		<form class="form-signin" action="<c:url value="/secure/Companylogin.controller" />" method="get">
			<h2 class="form-signin-heading">會員登入</h2>
			<label for="inputEmail" class="sr-only">Email address</label> 
			<input type="text" id="inputEmail" class="form-control"
				placeholder="Email address" required autofocus name="username"> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" class="form-control"
				placeholder="Password" required name="password">
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					記得帳號密碼? 
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
		</form>
	</div>
	<!-- /container -->
</body>

</html>
