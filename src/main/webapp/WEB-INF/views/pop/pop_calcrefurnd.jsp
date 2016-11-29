<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function() {
		billnum.focus();
	}
</script>

<script type="text/javascript">
	function input(index) {
		if (index == 1) {
			document.daily.action = "pop_calcrefurndlist";
		}

		document.daily.submit();
	}
</script>
</head>
<body >
	<!-- <form action="pop_calcrefurndlist" method="POST"> -->
	<form method="post" name=daily id=daily>
		<center>
			<input type="hidden" name="area" value="${area }">
			바코드 입력 학시오 : <input type="text" name="billnum" id="billnum" onkeypress="if(event.keyCode==13) {input(1);}">
			<br>
			<input type="button" value="입력" onclick='input(1)'>
		</center>
	</form>
</body>
</html>