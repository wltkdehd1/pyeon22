<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sec:authentication property="name" var="LoingUser" />
<meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath}/pos?id=${LoingUser}">
<script type="text/javascript">
	alert("알바 로그인 성공");
	history.go(1);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>