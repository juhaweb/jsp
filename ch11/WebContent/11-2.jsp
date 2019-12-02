<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>11-2. 표현언어 기본 내장객체</title>
</head>
<body>
	<h1>11-2. 표현언어 기본 내장객체</h1>
	
	<%
		// 자바 코드영역
		pageContext.setAttribute("name","김유신");
		request.setAttribute("name","김춘추");
		session.setAttribute("name","장보고");
		application.setAttribute("name","이순신");
	%>
	
	<ul>
		<%-- 표현언어에서는  +Scope --%>
		<li>${pageScope.name}</li>
		<li>${requestScope.name}</li>
		<li>${sessiontScope.name}</li>
		<li>${applicationScope.name}</li>
		
	</ul>
	
</body>
</html>