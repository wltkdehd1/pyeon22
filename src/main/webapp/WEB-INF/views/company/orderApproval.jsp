<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br><br><br>
	<table class="ex1">
		<thead>
			<tr>
				<th scope="col">카테고리</th>
				<th scope="col">상품 코드</th>
				<th scope="col">상 품 명</th>
				<th scope="col">수 량</th>
				<th scope="col">지 점</th>
				<th scope="col">발주 요청 시간</th>
				<th scope="col">발주 승인</th>
				<th scope="col">발주 미승인</th>
			</tr>
		</thead>


		<c:forEach items="${orderList}" var="orderList">
			<tbody>
				<form action="com_orderApproval" method="post">
					<input type="hidden" name="item_code"
						value="${orderList.item_code}"> <input type="hidden"
						name="count" value="${orderList.count}"> <input
						type="hidden" name="area" value="${orderList.area}"> <input
						type="hidden" name="item_name" value="${orderList.item_name}">
					<input type="hidden" name="category" value="${orderList.category}">
					<input type="hidden" name="p2_time" value="${orderList.p2_time}">
					<tr class="odd">
						<td class="date2">${orderList.category}</td>
						<td class="date2">${orderList.item_code}</td>
						<td class="date4">${orderList.item_name}</td>
						<td class="date2">${orderList.count}</td>
						<td class="date2">${orderList.area}</td>
						<td class="date2">${orderList.p2_time}</td>
						<td class="date2"><input type="submit" value="승인"></td>
						<td class="date2"><input type="button" value="미승인"
							onclick="document.location.href='${pageContext.request.contextPath}/company/com_orderCancel?item_code=${orderList.item_code}&area=${orderList.area}&count=${orderList.count}&item_name=${orderList.item_name}&category=${orderList.category}&p2_time=${orderList.p2_time}'"></td>
					</tr>
				</form>
			</tbody>
		</c:forEach>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>