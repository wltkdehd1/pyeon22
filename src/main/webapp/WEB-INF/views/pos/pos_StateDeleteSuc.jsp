<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<sec:authentication property="name" var="LoingUser" />
<meta http-equiv="Refresh"
	content="0; url=${pageContext.request.contextPath}/pos/ps_orderState?id=${LoingUser}">
<script type="text/javascript">
	alert("데이터 삭제 성공");
	history.go(1);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>