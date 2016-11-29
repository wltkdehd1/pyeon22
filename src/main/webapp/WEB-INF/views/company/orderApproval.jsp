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
<br><br><br>
	<table class="ex1">
		<thead>
			<tr>
				<th scope="col">ī�װ�</th>
				<th scope="col">��ǰ �ڵ�</th>
				<th scope="col">�� ǰ ��</th>
				<th scope="col">�� ��</th>
				<th scope="col">�� ��</th>
				<th scope="col">���� ��û �ð�</th>
				<th scope="col">���� ����</th>
				<th scope="col">���� �̽���</th>
			</tr>
		</thead>


		<c:forEach items="${orderList}" var="orderList">
			<tbody>
				<form action="com_orderApproval" method="post">
					<input type="hidden" name="item_code"
						value="${orderList.item_code}"> <input type="hidden"
						name="count" value="${orderList.count}"> <input
						type="hidden" name="area" value="${orderList.area}"> <input
						type="hidden" name="item_name" value="${orderList.item_name}">
					<input type="hidden" name="category" value="${orderList.category}">
					<input type="hidden" name="p2_time" value="${orderList.p2_time}">
					<tr class="odd">
						<td class="date2">${orderList.category}</td>
						<td class="date2">${orderList.item_code}</td>
						<td class="date4">${orderList.item_name}</td>
						<td class="date2">${orderList.count}</td>
						<td class="date2">${orderList.area}</td>
						<td class="date2">${orderList.p2_time}</td>
						<td class="date2"><input type="submit" value="����"></td>
						<td class="date2"><input type="button" value="�̽���"
							onclick="document.location.href='${pageContext.request.contextPath}/company/com_orderCancel?item_code=${orderList.item_code}&area=${orderList.area}&count=${orderList.count}&item_name=${orderList.item_name}&category=${orderList.category}&p2_time=${orderList.p2_time}'"></td>
					</tr>
				</form>
			</tbody>
		</c:forEach>
	</table>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>