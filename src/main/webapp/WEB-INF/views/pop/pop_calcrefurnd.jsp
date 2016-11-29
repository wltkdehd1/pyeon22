<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
	<form action="pop_calcrefurndlist" method="POST">
		<center>
			<input type="hidden" name="area" value="${area }">
			바코드 입력 학시오 : <input type="text" name="num">
			<br>
			<input type="submit" value="입력">
		</center>
	</form>
</body>
</html>