<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">


<se:authentication property="name" var="LoingUser" />

<div style="float: left; width: 33%">
　
</div>
<div style="float: left; width: 34%">
	<a href="${pageContext.request.contextPath}/"><img style="margin-left: auto; margin-right: auto; margin-top: 20px;margin-bottom: 20px; display: block  " alt="" src="/controller/resources/images/Logo2.png"></a> 
</div>
<div style="float: left; width: 33%; margin-top: 90px;  text-align: right;
	font-family: 'Jeju Gothic', sans-serif;">
	<se:authorize access="hasAuthority('ROLE_ADMIN')">
	[ ${LoingUser} ] 님 로그인 중<br>
	<a href="${pageContext.request.contextPath}/j_spring_security_logout">로
			그 아 웃</a>
	</se:authorize>
</div>


