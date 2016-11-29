<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<sec:authentication property="name" var="LoingUser" />
	<form
		action="${pageContext.request.contextPath}/company/com_notice_write"
		method="post">
		<input type="hidden" name="id" value="${LoingUser}">
		<table class="ex1">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제 목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>

			<c:forEach items="${result }" var="list">
				<tbody>
					<tr class="odd">
						<td class="date2">${list.noticenum }</td>
						<td class="date2"><a
							href="${pageContext.request.contextPath}/company/com_notice_contant?noticenum=${list.noticenum }&page=${page}&titleSearch=${titleSearch}">${list.title }</a></td>
						<td class="date2">${list.name}</td>
						<td class="date2">${list.noticedate }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		<br> <input style="display: block; float: right; margin-right: 70px;" width="40"
			type="image" src="/controller/resources/images/write.png"
			alt="submit">
	</form>
	<br>
	<div align="center">
	<form action="${pageContext.request.contextPath}/company/com_notice_list" method="get"> 
		<input class="ipt_insert" type="text" name="titleSearch">
		<input type="hidden" name="page" value=${pageNum }>
		<input class="submit" type="submit" value="검색">
	</form>
	</div>
	<br>
	<div>
		<ul class="com_stock_li-paging">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="${pageContext.request.contextPath}/company/com_notice_list?page=${pageMaker.startPage - 1 }&titleSearch=${titleSearch}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
					<a href="${pageContext.request.contextPath}/company/com_notice_list?page=${idx}&titleSearch=${titleSearch}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="${pageContext.request.contextPath}/company/com_notice_list?page=${pageMaker.endPage + 1 }&titleSearch=${titleSearch}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
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
</body>
</html>