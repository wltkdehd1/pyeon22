<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<script type="text/javascript">
	function button_event(btn) {
		var name = btn;
		var val = document.forms[name].elements['id'].value;

		if (val != null) {
			if (confirm("[" + val + "]" + "���� ������ ������ �����Ͻðڽ��ϱ�?") == true) {
				document.forms[name].submit();
			} else {
				return false;
			}
		}
	}
</script>


<title>�Ƹ�����Ʈ ��� ��Ȳ</title>
</head>
<body>
	<br>
	<br>
	<br>
	<table class="ex1">
		<thead>
			<tr>
				<th colspan="11"><c:forEach items="${ area }" var="area">
					${ area }
					���� �Ƹ�����Ʈ�� ���� ��Ȳ
				</c:forEach></th>
			</tr>
			<tr>
				<th scope="col">���̵�</th>
				<th scope="col">�� ��</th>
				<th scope="col">�� å</th>
				<th scope="col">��ȭ��ȣ</th>
				<th scope="col">�������</th>
				<th scope="col">�� ��</th>
				<th scope="col">�� ��</th>
				<th scope="col">�� ��</th>
				<th scope="col">�ٹ��ð�</th>
				<th scope="col">�� ��</th>
				<th scope="col">�� ��</th>
			</tr>
		</thead>
		<c:forEach items="${ list }" var="member">
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
					<td class="date5">${ member.optime }</td>
					<td class="date8"><input class="button_center" width="40"
						type="image" src="/controller/resources/images/update.png"
						alt="button"
						onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_user_updateForm?id=${member.id}'">
					</td>
					<td class="date8">
						<form
							action="${pageContext.request.contextPath}/pos/ps_user_delete"
							method="POST" name="${member.id}">

							<input type="hidden" name="id" value="${member.id}"> <input
								class="button_center" width="40" type="image"
								src="/controller/resources/images/delete.png" alt="submit"
								onclick="button_event('${member.id}');return false;" />
						</form>
					</td>
				</tr>
		</c:forEach>
	</table>

	<br>
	<br>
	<br>
</body>
</html>