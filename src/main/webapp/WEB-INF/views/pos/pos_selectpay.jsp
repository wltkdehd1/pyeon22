<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,com.pyeon2.vo.*"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<title>Insert title here</title>
</head>
<body>

	<sec:authorize access="hasAuthority('ROLE_USER')">
		<form action="ps_selectpay" method="post">
	</sec:authorize>

	<sec:authorize access="hasAuthority('ROLE_MANAGER')">
		<form action="ps_selectpays" method="post">
	</sec:authorize>

	<sec:authentication property="name" var="LoingUser" />
	<input type="hidden" value="${LoingUser }" name="ids">
	<select class="com_stock_select1" id="year" name="year">
		<option>--year--</option>
		<option value="" hidden=""></option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
	</select>
	<select class="com_stock_select1" id="year" name="month">
		<option>--month--</option>
		<option value="" hidden=""></option>
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>

	<input class="com_stock_button" width="40" type="image"
		src="/controller/resources/images/choice.png" alt="submit">
	<table class="ex1">
		<thead>
			<tr>
				<th scope="col">이름</th>
				<th scope="col">년</th>
				<th scope="col">월</th>
				<th scope="col">지역</th>
				<th scope="col">업무 시간</th>
				<th scope="col">급여</th>
			</tr>
		</thead>
		<c:forEach items="${result}" var="user">
			<tbody>
				<tr class="odd">
					<td class="date5">${user.userid }</td>
					<td class="date5">${user.year }</td>
					<td class="date5">${user.month }</td>
					<td class="date5">${user.area }</td>
					<td class="date5">${user.hour }</td>
					<td class="date5">${user.money }</td>
				</tr>
		</c:forEach>
	</table>
	</form>
	
	<br><br><br>
</body>
</html>