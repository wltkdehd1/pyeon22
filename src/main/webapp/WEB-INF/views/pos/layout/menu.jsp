<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


<sec:authentication property="name" var="LoingUser" />
<div class="w3-container">
	<ul class="w3-navbar w3-card-2 w3-center"
		style="background-color: #D5D9DF; font-family: 'Jeju Gothic', sans-serif;">
		<li></li>
		<li style="width: 20%" class="w3-dropdown-hover"><a href="#">재고
				관리 <i class="fa fa-caret-down"></i>
		</a>
			<div style="width: 266.5px;"
				class="w3-dropdown-content w3-light-gray w3-card-4">
				<sec:authorize access="hasAuthority('ROLE_MANAGER')">
					<a href="${pageContext.request.contextPath}/pos/ps_order">발 주 신
						청</a>
				</sec:authorize>
				<sec:authorize access="hasAuthority('ROLE_MANAGER')">
					<a
						href="${pageContext.request.contextPath}/pos/ps_orderState?id=${LoingUser}">발
						주 현 황</a>
				</sec:authorize>
				<a href="${pageContext.request.contextPath}/pos/ps_item_selectAll?id=${LoingUser}">상
					품 리 스 트</a>
			</div></li>

		<li style="width: 20%" class="w3-dropdown-hover"><a href="#">매출
				관리 <i class="fa fa-caret-down"></i> </a>
			<div style="width: 266.5px;" class="w3-dropdown-content w3-light-gray w3-card-4">
				<a href="${pageContext.request.contextPath}/pos/ps_daymoney?id=${LoingUser}">일 일 정 산</a> 
			</div>
		</li>

		<li style="width: 20%" class="w3-dropdown-hover"><a href="#">출
				/ 퇴근 관리 <i class="fa fa-caret-down"></i>
		</a>
			<div style="width: 266.5px;"
				class="w3-dropdown-content w3-light-gray w3-card-4">

				<sec:authorize access="hasAuthority('ROLE_USER')">
					<a
						href="${pageContext.request.contextPath}/pos/ps_selectpay?id=${LoingUser}">출
						/ 퇴근 이력 조회</a>
				</sec:authorize>
				<sec:authorize access="hasAuthority('ROLE_MANAGER')">
					<a
						href="${pageContext.request.contextPath}/pos/ps_selectpays?id=${LoingUser}">출
						/ 퇴근 이력 조회</a>
					<a
						href="${pageContext.request.contextPath}/pos/ps_user_selectForm?id=${LoingUser}">아르바이트생
						현황</a>
					<a
						href="${pageContext.request.contextPath}/pos/ps_user_insertForm?id=${LoingUser}">아르바이트생
						정보 등록</a>
				</sec:authorize>
			</div></li>

		<sec:authorize access="hasAnyAuthority('ROLE_MANAGER', 'ROLE_USER')">
			<li style="width: 20%"><a
				href="${pageContext.request.contextPath}/pos/ps_notice_list">공 지
					사 항</a></li>
		</sec:authorize>

		<sec:authorize access="hasAnyAuthority('ROLE_MANAGER', 'ROLE_USER')">
			<li style="width: 20%"><a
				href="${pageContext.request.contextPath}/pos/ps_calcform?id=${LoingUser}">계
					산</a></li>
		</sec:authorize>
	</ul>
</div>
