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

<style type="text/css">
.table_write {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
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
}
</style>

</head>
<body>
<br><br><br>
	<form action="com_notice_list" method="post">
		<c:forEach items="${result }" var="list">
			<table class="table_write">
				<tr class="tr_write">
					<th class="th_write">제목</th>
					<td class="td_write1"><input style="width: 430px;" type="text"
						name="title"></td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">이름</th>
					<td class="td_write1"><input type="hidden"
						value="${list.name }" name="name">${list.name }</td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">직급</th>
					<td class="td_write1"><input type="hidden"
						value="${list.position }" name="position">${list.position }</td>
				</tr>
				<tr class="tr_write">
					<th class="th_write">내용</th>
					<td class="td_write2"><textarea rows="15" cols="50"
							name="contant" wrap="hard"></textarea></td>
				</tr>
				</tbody>
				</thead>
			</table>
			<br>
			<input style="display: block; float: right; margin-right: 350px;"
				width="40" type="image" src="/controller/resources/images/write.png"
				alt="submit">
		</c:forEach>
	</form>
	<br><br><br>
</body>
</html>