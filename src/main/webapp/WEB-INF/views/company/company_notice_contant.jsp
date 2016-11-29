<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table_write {
	margin-left: auto;
	margin-right: auto;
	width: 40%;
	text-align: center;
	border-collapse: collapse;
	font-family: 'Jeju Gothic', sans-serif;
}

.th_write {
	text-align: left;
	background: #054A75;
	color: #fff;
	text-align: center;
	border-right: 1px solid #fff;
	height: 40px;
	width: 20%;
}

.tr_write {
	background: #f9f9f9;
	width: 80%;
}

.tr_write:hover {
	background: #F3F5BB
}

.td_write1 {
	height: 50px;
}

.td_write2 {
	height: 400px;
	font-family: 'Jeju Gothic', sans-serif;
}
</style>


<script type="text/javascript">
	function input(index) {
		if (index == 1) {
			document.daily.action = "${pageContext.request.contextPath}/company/com_notice_modify";
		}
		if (index == 2) {
			document.daily.action = "${pageContext.request.contextPath}/company/com_notice_delete";
		}
		document.daily.submit();
	}
</script>
</head>


<body>
	<br>
	<br>
	<br>
	<form method="post" name=daily id=daily>
		<c:forEach items="${result }" var="list">
			<input type="hidden" value="${ list.noticenum}" name="noticenum">
			<table class="table_write">
				<tr class="tr_write">
					<th class="th_write">제목</th>
					<td class="td_write1">${list.title }</td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">이름</th>
					<td class="td_write1">${list.name }</td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">직급</th>
					<td class="td_write1">${list.position }</td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">내용</th>
					<td class="td_write2"><pre><font face="Jeju Gothic">${list.contant }</font></pre></td>
				</tr>
			</table>
			<br>
			<input style="display: block; float: left; margin-right: 20px; margin-left: 780px;"
				width="40" type="image"
				src="/controller/resources/images/update.png" alt="button"
				onclick='input(1)' />
			<input style="display: block; float: left; margin-right: 20px;"
				width="40" type="image"
				src="/controller/resources/images/delete.png" alt="button"
				onclick='input(2)' />

		</c:forEach>
	</form>
			<input style="display: block; float: left; margin-right: 20px;"
				width="40" type="image" src="/controller/resources/images/list.png"
				alt="button"
				onclick="document.location.href='${pageContext.request.contextPath}/company/com_notice_list?page=${page }&titleSearch=${titleSearch}'" />
	<br>
	<br>
	<br>
</body>
</html>