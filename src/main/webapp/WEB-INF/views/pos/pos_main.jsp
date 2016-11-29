<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>POS MAIN</title>
</head>
<body>
	<div style="float: left; width: 50%; margin-top: 10px;">
		<table class="ex1">
			<thead>
				<tr>
					<th style="text-align: left; background-color: #FFFFFF;"><font
						color="#054A75"> 공지사항 </font><input
						style="float: right; margin-right: 20px;" type="image"
						src="/controller/resources/images/more.png" alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_notice_list'" /></th>
				</tr>
			</thead>
		</table>

		<table class="ex1">
			<thead>
				<tr class="odd">
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>

			<c:forEach items="${ list }" var="list">
				<tbody>
					<tr class="odd">
						<td class="date4"><a
							href="${pageContext.request.contextPath}/pos/ps_notice_contant?noticenum=${list.noticenum }">${list.title }</a></td>
						<td class="date2">${ list.noticedate }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<br><br>
		<table class="ex1">
			<thead>
				<tr>
					<th style="text-align: left; background-color: #FFFFFF;"><font
						color="#054A75"> 재고 부족 건</font> 
						<c:if test="${ count != 0 }">
						<font color=red> ( ${ count } 건 ) </font>
						</c:if>
						<input
						style="float: right; margin-right: 20px;" type="image"
						src="/controller/resources/images/more.png" alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_order'" /></th>
				</tr>
			</thead>
		</table>

		<table class="ex1">
			<thead>
				<tr class="odd">
					<th scope="col">카테고리</th>
					<th scope="col">상품명</th>
					<th scope="col">재고량</th>
				</tr>
			</thead>

			<c:forEach items="${ list2 }" var="list">
				<tbody>
					<tr class="odd">
						<td class="date2">${ list.category }</td>
						<td class="date4">${ list.item_name }</td>
						<td class="date2">${ list.count }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>