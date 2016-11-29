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
	<form
		action="${pageContext.request.contextPath}/company/com_companyStock"
		method="post">
		<select class="com_stock_select1" name="category">
			<option value="all">전체보기</option>
			<option value="음료">음료</option>
			<option value="스낵">스낵</option>
			<option value="인스턴트">인스턴트</option>
			<option value="주류">주류</option>
		</select> 
		
		<input class="com_stock_button" width="40" type="image" src="/controller/resources/images/choice.png" alt="submit">
		
		<input type="button" value="재품 추가"
				onclick="document.location.href='${pageContext.request.contextPath}/company/com_newproduct'" />
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
					<th scope="col">원 가</th>
					<th scope="col">소비자 가격</th>
					<th scope="col">재고 수량</th>
				</tr>
			</thead>
			<c:forEach items="${result}" var="list">
				<tbody>
				<tr class="odd">
					<td class="date1"><img width="30" height="50"  src="${list.item_image }"></td>
					<td class="date2">${list.category}</td>
					<td class="date3">${list.item_code}</td>
					<td class="date4">${list.item_name}</td>
					<td class="date5">${list.cost} 원</td>
					<td class="date9">${list.price} 원</td>
					<td class="date6">${list.count} 개</td>
				</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>

	<div>
		<ul class="com_stock_li-paging">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="${pageContext.request.contextPath}/company/com_companyStock?page=${pageMaker.startPage - 1 }&category=${category}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a
					href="${pageContext.request.contextPath}/company/com_companyStock?page=${idx}&category=${category}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="${pageContext.request.contextPath}/company/com_companyStock?page=${pageMaker.endPage + 1 }&category=${category}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>