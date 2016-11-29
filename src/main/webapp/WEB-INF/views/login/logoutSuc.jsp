<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<se:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
		<meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath}/j_spring_security_logout">

		<script type="text/javascript">
			alert("퇴근 처리가 완료되었습니다.");
			history.go(1);
		</script>
	</se:authorize>
	<se:authorize access="hasAuthority('ROLE_MANAGER')">
		<meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath}/j_spring_security_logout">

		<script type="text/javascript">
			alert("퇴근 처리가 완료되었습니다.");
			history.go(1);
		</script>
	</se:authorize>
</body>
</html>