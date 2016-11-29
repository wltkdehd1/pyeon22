<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, com.pyeon2.vo.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/controller/resources/css/style.css">



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function input(index) {
		if (index == 1) {
			document.daily.action = "${pageContext.request.contextPath}/pos/ps_calc";
		}
		if (index == 2) {
			document.daily.action = "${pageContext.request.contextPath}/pos/ps_daycalc";
		}
		if (index == 3) {
			document.daily.action = "${pageContext.request.contextPath}/pos/ps_daycalcfin";
		}
		if (index == 4) {
			document.daily.action = "${pageContext.request.contextPath}/pos/ps_calccancle";
		}

		document.daily.submit();
	}
</script>

<script type="text/javascript">
	window.onload = function() {
		item_code.focus();
	}
</script>

</head>
<body>
	<sec:authentication property="name" var="LoingUser" />
	<form method="post" name=daily id=daily>
		<div class="div_container">
			<div class="div_row">
				<div class="div_col">
					<br> <br>
				</div>

				<div class="div_col">
					<br> <br>
				</div>
			</div>

			<div class="div_row">
				<div class="div_col">
					<table class="table">
						<tr>
							<th class="th1">상품 코드</th>
							<th class="th1">상 품 명</th>
							<th class="th1">개 수</th>
							<th class="th1">카테고리</th>
							<th class="th1">금 액</th>
						</tr>
						<c:forEach items="${result }" var="cal">
							<tr>
								<td class="td1">${cal.item_code }</td>
								<td class="td1">${cal.item_name }</td>
								<td class="td1">${cal.count }</td>
								<td class="td1">${cal.category }</td>
								<td class="td1"><fmt:formatNumber value="${cal.price}"
										groupingUsed="true" /> 원</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="div_col">
					<table class="table">
						<tr>
							<th class="th1">총액</th>
							<td class="td1" colspan="2"><input type="hidden"
								name="total" value="${total}"> <input class="inpt"
								type="text"
								value="<fmt:formatNumber value="${total}"
									groupingUsed="true"/>원"
								readonly="readonly"></td>
						</tr>

						<tr>
							<th class="th1">지 불 액</th>
							<td class="td1"><input class="inpt" type="text" name="pay"
								value="0"></td>
							<td class="td1"><input class="submit2" type="button"
								value="입력" onclick='input(2)' /></td>
						</tr>

						<tr>
							<th class="th1">거스름돈</th>
							<td class="td1" colspan="2"><input type="hidden" name="pay"
								value="${pay }"> <input class="inpt" type="text"
								value="<fmt:formatNumber value="${pay}"
									groupingUsed="true" />원">
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="div_row">
				<div class="div_col">
					<table class="table" style="margin-top: 50px">
						<tr>
							<th class="th1">상품 코드</th>
							<td class="td1"><input class="inpt" type="text"
								name="item_code" id="item_code"
								onkeypress="if(event.keyCode==13) {input(1);}" class="invisible">
							</td>
							<input type="hidden" name="area" value="${ area }">
							<td><input class="submit2" type="button" value="입력"
								onclick='input(1)' /></td>
					</table>
				</div>
				<div class="div_col">
					<table class="table" style="margin-top: 50px">
						<tr>
							<td colspan="2"><input class="submit2" type="button"
								value="계산" onclick='input(3)'></td>
						</tr>

						<tr>
							<td><input class="submit2" type="button" value="환불"
								onclick="window.open('${pageContext.request.contextPath}/pop_calcrefurnd?id=${LoingUser}','window','width=350,height=580,left=500,top=50')">
							</td>
							<td><input class="submit2" type="button" value="계산 취소"
								onclick='input(4)'></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>

</body>
</html>