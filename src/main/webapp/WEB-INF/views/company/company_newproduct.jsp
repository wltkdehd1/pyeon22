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
				<td>�� ǰ ��</td>
				<td><input type="text" name="item_name"/></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><input type="text" name="cost"/></td>
			</tr>
			<tr>
				<td>�� �� ��</td>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="count"/></td>
			</tr>
			<tr>
				<td>ī�°�</td>
				<td>
					<select name="category">
						<option value="all">����</option>
						<option value="����">����</option>
						<option value="����">����</option>
						<option value="�ν���Ʈ">�ν���Ʈ</option>
						<option value="�ַ�">�ַ�</option>
					</select> 
				</td>
			</tr>
		</table>
		<input type="hidden" name="id" value="${LoingUser}">
		<input type="submit" value="�߰�">
	</form>
</body>
</html>