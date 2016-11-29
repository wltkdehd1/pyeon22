<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정표</title>
<script type="text/javascript">
	function button_event(btn) {
		var name = btn;
		var val = document.forms[name].elements['content'].value;

		if (val != null) {
			if (confirm("일정을 정말로 삭제하시겠습니까?") == true) {
				document.forms[name].submit();
			} else {
				return false;
			}
		}
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/company/com_calendarMemoInsert">
<table style="margin: auto">
	<tr>
		<td colspan="2" align="center">
		<font face="Jeju Gothic" size="3"><b>${year}년 ${month + 1}월 ${day }일 일정표</b></font>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<textarea rows="15" cols="25" name="memo">${ content }</textarea>
		</td>
	</tr>
	<tr>
		<td align="right" align="center">
		<input type="submit" value="입력">
		<input type="hidden" value=${year } name="year">
		<input type="hidden" value=${month } name="month">
		<input type="hidden" value=${day } name="day">
		</td>
</form>

	<td>
	<form action="${pageContext.request.contextPath}/company/com_calendarMemoDelete"
	method="POST" name="content">
		<input type="hidden" id="content" value="${content}">
		<input type="button" value="삭제" alt="submit" onclick="button_event('content');return false;">
		<input type="hidden" value=${year } name="year">
		<input type="hidden" value=${month } name="month">
		<input type="hidden" value=${day } name="day">
	</form>
	</td>
	</tr>
</table>

</body>
</html>