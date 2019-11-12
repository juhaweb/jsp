<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-1. session</title>
</head>
<body>
	<h1>10-1. 세션</h1>
	
	<%
		session.setAttribute("name", "홍길동");
		session.setAttribute("uid", "hong");
		session.setMaxInactiveInterval(60*3);
	%>
	
	<h4> 세션값 저장 완료! </h4>
	<a href="./10-2.jsp">세션값 확인하기</a>
	
	
</body>
</html>