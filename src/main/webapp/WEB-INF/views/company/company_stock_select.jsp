<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td align="center">item_code</td>
			<td align="center">item_name</td>
			<td align="center">item_image</td>
			<td align="center">price</td>
			<td align="center">count</td>
			<td align="center">hit</td>
			<td align="center">category</td>
			<td align="center">area</td>
		</tr>

		<!-- 	result�� controller�� addObject�� ���� �����´�. -->
	
		<c:forEach items="${result }" var="product" varStatus="idx">
			<tr>
				<td>${product.item_code }</td>
				<td>${product.item_name }</td>
				<td><img width="30" height="60" src="/controller/resources/item_image/${product.item_image }"></td>
				<td>${product.price }</td>
				<td>${product.count }</td>
				<td>${product.hit }</td>
				<td>${product.category }</td>
				<td>${product.area }</td>
				<td>
					<input type="button" value="����" onclick="document.location.href='ps_item_delete_now?item_code=${product.item_code}&area=${product.area}&page=${pageMaker.cri.page }'">
					<%-- <form action="itemdelete">	
						<input type="hidden" value="${product[idx.index].ItemVO.item_code}">
						<input type="hidden" value="${product[idx.index].ItemVO.area}">
						<input type="submit" value="����">
					</form> --%>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<br>
	<form action="${pageContext.request.contextPath}company/com_stock_select" method="post">
		<input type="hidden" value="${pageMaker.cri.page }">
		<select name="category">
 			<option value="����">����</option>
  			<option value="����">����</option>
  			<option value="�ν���Ʈ">�ν���Ʈ</option>
  			<option value="�ַ�">�ַ�</option>
		</select>
		�˻��� ��ǰ : <input type="text" name="item_name">
		<input type="submit" value="�˻�">
	</form>

	<br>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="${pageContext.request.contextPath}company/com_stock_select?page=${pageMaker.startPage - 1 }&category=${category}&item_name=${item_name}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }"/>>
				<a href="${pageContext.request.contextPath}company/com_stock_select?page=${idx}&category=${category}&item_name=${item_name}">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="${pageContext.request.contextPath}company/com_stock_select?page=${pageMaker.endPage + 1 }&category=${category}&item_name=${item_name}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>