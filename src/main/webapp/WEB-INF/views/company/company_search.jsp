<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript">
	function button_event(btn) {
		var name = btn;
		var val = document.forms[name].elements['id'].value;

		if (val != null) {
			if (confirm("[" + val + "]" + "님의 정보를 정말로 삭제하시겠습니까?") == true) {
				document.forms[name].submit();
			} else {
				return false;
			}
		}
	}
</script>
<title>관리자/지점장 선택 후 리스트 출력</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/company/com_search"
		method="post">
		<select class="com_stock_select1" name="position">
			<option value="all">전체 검색</option>
			<option value="admin">관리자</option>
			<option value="manager">지점장</option>
		</select> &nbsp;&nbsp; <input class="com_stock_button" width="40" type="image"
			src="/controller/resources/images/choice.png" alt="submit">
	</form>

	<table class="ex1" id="listTable">
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이 름</th>
				<th scope="col">직 책</th>
				<th scope="col">전화번호</th>
				<th scope="col">생년월일</th>
				<th scope="col">주 소</th>
				<th scope="col">성 별</th>
				<th scope="col">지 점</th>
				<th scope="col">수 정</th>
				<th scope="col">삭 제</th>
			</tr>
		</thead>

		<c:forEach items="${ result }" var="member">
			<tbody>
				<tr class="odd">
					<td class="date5">${ member.id }</td>
					<td class="date2">${ member.name }</td>
					<td class="date3">${ member.position }</td>
					<td class="date5">${ member.phone }</td>
					<td class="date6">${ member.age }</td>
					<td class="date7">${ member.address } ${ member.address2 }</td>
					<td class="date8">${ member.gender }</td>
					<td class="date5">${ member.area }</td>
					<td class="date8"><input class="button_center" width="40"
						type="image" src="/controller/resources/images/update.png"
						alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/company/com_updateForm?id=${member.id}'">
					<td class="date8">
						<form
							action="${pageContext.request.contextPath}/company/com_delete"
							method="POST" name="${member.id}">

							<input type="hidden" name="id" value="${member.id}"> <input
								class="button_center" width="40" type="image"
								src="/controller/resources/images/delete.png" alt="submit"
								onclick="button_event('${member.id}');return false;">
						</form>
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