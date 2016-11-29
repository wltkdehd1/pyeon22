<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	
	<table class="ex1">
		<thead>
			<tr>
				<th scope="col">카테고리</th>
				<th scope="col">상품 코드</th>
				<th scope="col">상 품 명</th>
				<th scope="col">신청 갯수</th>
				<th scope="col">지 점</th>
				<th scope="col">발주 신청 날짜</th>
				<th scope="col">상 태</th>
				<th scope="col">제 거</th>
			</tr>
		</thead>

		
		<c:forEach items="${list}" var="list" varStatus="idx">
			<tbody>
				<tr class="odd">
					<td class="date2">${list.category }</td>
					<td class="date2">${list.item_code }</td>
					<td class="date3">${list.item_name }</td>
					<td class="date4">${list.count }</td>
					<td class="date5">${list.area }</td>
					<td class="date6">${list.p2_time }</td>
					<td class="date7">${list.state }</td>
					<td class="date8"><input width="40" type="image"
						src="/controller/resources/images/delete.png" alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_orderStates?item_code=${list.item_code}&p2_time=${list.p2_time}'">
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>