<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="pop_calcrefurnd_delete">
		<input type="hidden" name="billnum" value="${billnum }">
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="area" value="${area }">
		<table>
			<tr>
				<th>코드번호</th>
				<th>상품</th>
				<th>개수</th>
				<th>가격</th>
			</tr>
			<c:forEach items="${result }" var="list">
				<tr>
					<td>${list.item_code }</td>
					<td>${list.item_name }</td>
					<td>${list.count}</td>
					<td>${list.price }</td>
				</tr>
			</c:forEach>
		</table>
		<br><br><br>
		
		<input type="submit" value="환불">
	</form>
</body>
</html>