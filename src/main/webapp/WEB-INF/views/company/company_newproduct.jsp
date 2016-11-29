<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="name" var="LoingUser" />
	<form action="com_companyStock2" method="POST">
		<table>
			<tr>
				<td>상 품 명</td>
				<td><input type="text" name="item_name"/></td>
			</tr>
			<tr>
				<td>원 가</td>
				<td><input type="text" name="cost"/></td>
			</tr>
			<tr>
				<td>판 매 가</td>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="count"/></td>
			</tr>
			<tr>
				<td>카태고리</td>
				<td>
					<select name="category">
						<option value="all">선택</option>
						<option value="음료">음료</option>
						<option value="스낵">스낵</option>
						<option value="인스턴트">인스턴트</option>
						<option value="주류">주류</option>
					</select> 
				</td>
			</tr>
		</table>
		<input type="hidden" name="id" value="${LoingUser}">
		<input type="submit" value="추가">
	</form>
</body>
</html>