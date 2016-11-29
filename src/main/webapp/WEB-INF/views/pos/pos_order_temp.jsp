<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath}/pos/ps_order">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>
<c:if test="${check == 1 }">
	<script type="text/javascript">
		alert("삭제 성공");
		history.go(1);
	</script>
</c:if>
<c:if test="${check == null }">
	<script type="text/javascript">
		alert("발주 성공");
		history.go(1);
	</script>
</c:if>
</body>
</html>