<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.pyeon2.vo.*"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>	
	<sec:authentication property="name" var="LoingUser" />
	<form action="ps_item_select_now" method="post">
		<input type="hidden" value="${pageMaker.cri.page}"> <input
			type="hidden" name="id" value="${LoingUser}"> <select
			class="com_stock_select1" name="category">
			<option value="음료">음료</option>
			<option value="스낵">스낵</option>
			<option value="인스턴트">인스턴트</option>
			<option value="주류">주류</option>
		</select> <label class="com_stock_label">검색할 제품명 </label> <input
			class="com_stock_input" type="text" name="item_name"> <input
			class="com_stock_button" width="40" type="image"
			src="/controller/resources/images/choice.png" alt="submit">
	</form>
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
				<th scope="col">재고 제거</th>
			</tr>
		</thead>
		<!-- 	result는 controller의 addObject로 부터 가져온다. -->

		<c:forEach items="${result }" var="product" varStatus="idx">
			<tbody>
				<tr class="odd">
					<td class="date1"><img width="50" height="50"
						src="/controller/resources/item_image/${product.item_image }"></td>
					<td class="date2">${product.category }</td>
					<td class="date3">${product.item_code }</td>
					<td class="date4">${product.item_name }</td>
					<td class="date5">${product.price }</td>
					<td class="date6">${product.count }</td>
					<td class="date7">${product.hit }</td>
					<td class="date8"><input width="40" type="image"
						src="/controller/resources/images/delete.png" alt="button"
						onclick="document.location.href='ps_item_delete_now?item_code=${product.item_code}&area=${product.area}&page=${pageMaker.cri.page }'">
					</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>


	<div>
		<ul class="com_stock_li-paging">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="ps_item_selectAll?page=${pageMaker.startPage - 1 }&id=${id}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a href="ps_item_selectAll?page=${idx}&id=${id}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="ps_item_selectAll?page=${pageMaker.endPage + 1 }&id=${id}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>