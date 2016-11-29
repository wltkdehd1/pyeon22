<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ps_daymoneyconfirm" method="POST">
		<div class="div_container">
			<div class="div_row" style="margin-top: 30px;">
				<div class="div_col">
					<table class="table">
						<tr>
							<th colspan="3" class="th1">수입</th>
						</tr>
						<tr>
							<th class="th2">제목</th>
							<th class="th2">금액</th>
							<th class="th2">날짜</th>
						</tr>
						<c:forEach items="${ result1}" var="list">
							<tr>
								<td class="td1">${list.sold }</td>
								<td class="td1">${list.pay }</td>
								<td class="td1">${list.sal_time }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="div_col">
					<table class="table">
						<tr>
							<th colspan="3" class="th1">지출</th>
						</tr>
						<tr>
							<td class="th2">제목</td>
							<td class="th2">금액</td>
							<td class="th2">날자</td>
						</tr>
						<c:forEach items="${ result2}" var="list2">
							<tr>
								<td class="td1">${list2.spend }</td>
								<td class="td1">${list2.pay }</td>
								<td class="td1">${list2.sal_time }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
			</div>
			<br><br><br><br><br>
			<input type="hidden" value="${ area}" name="area"> 
			<input style="float: right; " class="submit" type="submit" value="정산">
			<br><br><br><br><br><br><br><br><br><br>
		</div>
	</form>
</body>
</html>