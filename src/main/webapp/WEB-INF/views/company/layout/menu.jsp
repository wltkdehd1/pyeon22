<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/listcss.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


<div>
	<ul class="w3-navbar w3-card-2 w3-center"
		style="background-color: #D5D9DF; font-family: 'Jeju Gothic', sans-serif;">
		<li></li>
		<li style="width: 33.33%" class="w3-dropdown-hover"><a href="#">재고
				관리 <i class="fa fa-caret-down"></i>
		</a>
			<div style="width: 454px;"
				class="w3-dropdown-content w3-light-gray w3-card-4">
				<a
					href="${pageContext.request.contextPath}/company/com_orderApproval">발
					주 승 인</a> <a
					href="${pageContext.request.contextPath}/company/com_stock">매장별
					재고 현황</a> <a
					href="${pageContext.request.contextPath}/company/com_companyStock">본사
					재고 현황</a>
			</div></li>

		<li style="width: 33.33%" class="w3-dropdown-hover"><a href="#">매장
				관리 <i class="fa fa-caret-down"></i>
		</a>
			<div style="width: 454px;"
				class="w3-dropdown-content w3-light-gray w3-card-4">
				<sec:authorize access="hasAuthority('ROLE_ADMIN')">
					<a
						href="${pageContext.request.contextPath}/company/com_notice_list">공
						지 사 항</a>
					<a
						href="${pageContext.request.contextPath}/company/com_importSpendList">매장별 수입/지출</a>
				</sec:authorize>
			</div>
			
		</li>

		<li style="width: 33.33%" class="w3-dropdown-hover"><a href="#">인사
				관리 <i class="fa fa-caret-down"></i>
		</a>
			<div style="width: 454px;"
				class="w3-dropdown-content w3-light-gray w3-card-4">
				<a href="${pageContext.request.contextPath}/company/com_searchForm">직원
					검색</a> <a
					href="${pageContext.request.contextPath}/company/com_insertForm">직원
					정보 등록</a>
			</div></li>
	</ul>
</div>