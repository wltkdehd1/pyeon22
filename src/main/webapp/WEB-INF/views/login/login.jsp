<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 300px;
	margin-top: 150px;
}

</style>
<title>로그인해주세요</title>
</head>
<body>
<center>
	<sec:authorize ifAnyGranted="ROLE_ADMIN">
		<meta http-equiv="Refresh" content="0; url=company">
	</sec:authorize>
	<sec:authorize ifAnyGranted="ROLE_USER ,ROLE_MANAGER">
		<meta http-equiv="Refresh" content="0; url=pos">
	</sec:authorize>
	
	<c:url value="/j_spring_security_check" var="loginURL"></c:url>
	<form action="${loginURL}" method="post">
		<div>
			<label for="fname">
				<img src="/controller/resources/images/users.png"/>&nbsp;&nbsp;
			</label>
				<input name="j_username" class="text" style="height: 20px;"/>
			<p>
			
			<label for="lname">
				<img src="/controller/resources/images/lock.png">&nbsp;&nbsp;
			</label>
				<input type="password" name="j_password" class="text" style="height: 20px;"/>
			<p>
			
			<input type="submit" value="Login" />
		</div>
	</form>
</center>
</body>
</html>