<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.pyeon2.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<sec:authentication property="name" var="name" />
	<div style="overflow: auto;">
		<div style="float: left; width: 50%;">
			<table class="ex1">
				<thead>
					<tr>
						<th scope="col">��ǰ<br>�̹��� </th>
						<th scope="col">ī �� �� ��</th>
						<th scope="col">�� ǰ �� ��</th>
						<th scope="col">�� ǰ ��</th>
						<th scope="col">�� ��</th>
						<th scope="col">�Һ��� ����</th>
						<!-- <th scope="col">���<br>����
						</th> -->
						<th scope="col">�� ��</th>
					</tr>
				</thead>

				<c:forEach items="${result}" var="list">
					<tbody>
						<tr class="odd">
							<td class="date2"><img width="30" height="50"
								src="/controller/resources/item_image/${list.item_image }"></td>
							<td class="date2">${list.category}</td>
							<td class="date3">${list.item_code}</td>
							<td class="date9">${list.item_name}</td>
							<td class="date5">${list.cost}��</td>
							<td class="date9">${list.price}��</td>
							<%-- <td class="date6">${list.count}��</td> --%>
							<td class="date8"><input width="40" type="image"
								src="/controller/resources/images/check.png" alt="button"
								onclick="document.location.href='${pageContext.request.contextPath}/pos/ps_order?item_code=${list.item_code}&item_name=${list.item_name}&category=${list.category }&page=${pageMaker.cri.page }&name=${name}'">
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<div>
				<ul class="com_stock_li-paging">
					<c:if test="${pageMaker.prev }">
						<li><a
							href="${pageContext.request.contextPath}/pos/ps_order?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
							<a
							href="${pageContext.request.contextPath}/pos/ps_order?page=${idx}">${idx }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li><a
							href="${pageContext.request.contextPath}/pos/ps_order?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			<br> <br> <br>
		</div>

		<div style="float: left; width: 50%;">
			<div>
				<form action="${pageContext.request.contextPath}/pos/ps_order"
					method="post">
					<table id="table_order">
						<input type="hidden" name="state" value="���� ���">
						<tr>
							<td id="order_label">��ǰ �ڵ�</td>
							<td colspan="2"><input id="input_order" type="text"
								name="item_code" value="${item_code}"></td>
						</tr>
						<tr>
							<td id="order_label">��ǰ �̸�</td>
							<td colspan="2"><input id="input_order" type="text"
								name="item_name" value="${item_name}"></td>
						</tr>
						<tr>
							<td id="order_label">��ǰ ����</td>
							<td colspan="2"><input id="input_order" type="text"
								name="count"></td>
						</tr>
						<tr>
							<td id="order_label">ī�װ�</td>
							<td colspan="2"><input id="input_order" type="text"
								name="category" value="${category}"></td>
						</tr>
						<tr>
							<td id="order_label">�� ��</td>
							<td><input id="input_order" type="text" name="area"
								value="${area}" readonly="readonly"></td>
							<td><input class="com_stock_button" width="40" type="image"
								src="/controller/resources/images/add.png" alt="submit"></td>
						</tr>
					</table>
				</form>
			</div>
			<br> <br> <br>

			<div>
				<table class="ex1">
					<thead>
						<tr>
							<th scope="col">��ǰ<br>�ڵ�
							</th>
							<th scope="col">��ǰ<br>�̸�
							</th>
							<th scope="col">�� ��</th>
							<th scope="col">ī�װ�</th>
							<th scope="col">�� ��</th>
							<th scope="col">��û<br>�ð�
							</th>
							<th scope="col">��û<br>����
							</th>
						</tr>
					</thead>
					<c:forEach items="${list }" var="list">
						<tbody>
							<tr class="odd">
								<td class="date2">${list.item_code }</td>
								<td class="date2">${list.item_name }</td>
								<td class="date2">${list.count }</td>
								<td class="date2">${list.category }</td>
								<td class="date2">${list.area}</td>
								<td class="date9">${list.p2_time }</td>
								<td class="date2"><input width="40" type="image"
									src="/controller/resources/images/delete.png" alt="button"
									onclick="document.location.href='ps_order_temp_delete?item_code=${list.item_code}&area=${list.area}&page=${pageMaker.cri.page }'">
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<form action="${pageContext.request.contextPath}/pos/ps_order_temp"
					method="post">
					<input style="float: right; margin-right: 30px;" width="40"
						type="image" src="/controller/resources/images/check.png"
						alt="submit">
				</form>
			</div>
		</div>
	</div>
</body>
</html>