<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자/지점장 리스트 출력</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_search" method="post">
		<select class="com_stock_select1" name="position">
			<option value="all">전체 검색</option>
			<option value="admin">관리자</option>
			<option value="manager">지점장</option>
		</select> &nbsp;&nbsp; 
		<input
			class="com_stock_button" width="40" type="image"
			src="/controller/resources/images/choice.png" alt="submit">
	</form>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>