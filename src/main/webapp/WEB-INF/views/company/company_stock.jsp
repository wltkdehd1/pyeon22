<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>
	<form action="${pageContext.request.contextPath}/company/com_stock"
		method="post">
		<input type="hidden" value="${pageMaker.cri.page }"> <select
			class="com_stock_select1" name="area">
			<option value="판교">판 교 점</option>
			<option value="정자">정 자 점</option>
			<option value="야탑">야 탑 점</option>
		</select> <select class="com_stock_select2" name="category">
			<option value="">category</option>
			<option value="음료">음료</option>
			<option value="스낵">스낵</option>
			<option value="인스턴트">인스턴트</option>
			<option value="주류">주류</option>
		</select> 
		
		<label class="com_stock_label">검색할 제품명 </label> 
		
		<input class="com_stock_input"
			type="text" name="item_name">
		<input class="com_stock_button" width="40" type="image" src="/controller/resources/images/choice.png" alt="submit">
	</form>

	<c:if test="${result == null}">
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
	</c:if>

	<c:if test="${result != null}">
		<br>
		<br>
		<br>
		<table class="ex1">
			<thead>
				<tr>
					<th scope="col">상품 이미지</th>
					<th scope="col">카 테 고 리</th>
					<th scope="col">상 품 코 드</th>
					<th scope="col">상 품 명</th>
					<th scope="col">소비자 가격</th>
					<th scope="col">재고 수량</th>
					<th scope="col">판 매 량</th>
					<th scope="col">지 점</th>
				</tr>
			</thead>

			<c:forEach items="${result}" var="list">
				<tbody>
					<tr class="odd">
						<td class="date1"><img width="50" height="50"
							src="/controller/resources/item_image/${list.item_image }"></td>
						<td class="date2">${list.category}</td>
						<td class="date3">${list.item_code}</td>
						<td class="date4">${list.item_name}</td>
						<td class="date5">${list.price} 원</td>
						<td class="date6">${list.count} 개</td>
						<td class="date7">${list.hit} 개</td>
						<td class="date8">${list.area}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>

	<br>

	<div>
		<ul class="com_stock_li-paging">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="${pageContext.request.contextPath}/company/com_stock?page=${pageMaker.startPage - 1 }&item_name=${item_name}&category=${category}&area=${area}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a
					href="${pageContext.request.contextPath}/company/com_stock?page=${idx}&item_name=${item_name}&category=${category}&area=${area}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="${pageContext.request.contextPath}/company/com_stock?page=${pageMaker.endPage + 1 }&item_name=${item_name}&category=${category}&area=${area}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>