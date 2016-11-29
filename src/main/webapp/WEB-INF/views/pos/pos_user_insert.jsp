<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sec:authentication property="name" var="LoingUser" />
<sec:authorize access="hasAuthority('ROLE_MANAGER')">
<meta http-equiv="Refresh"
	content="0; url=${pageContext.request.contextPath}/pos/ps_user_selectForm?id=${LoingUser}">
<script type="text/javascript">
	alert("멤버 등록 성공!");
	history.go(1);
</script>
</sec:authorize>
<title>멤버 등록 성공</title>
</head>
<body>

</body>
</html>