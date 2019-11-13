<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pageContext 기본 객체</title>
</head>
<body>
	<h1>pageContext 기본 객체</h1>
	
	<%
		HttpServletRequest httpRequest = 
			(HttpServletRequest)pageContext.getRequest();
	%>
	
	<h3>
		기본 객체와 pageContext.getRequest()의 동일여부 : 
		<%= request == httpRequest %>
	</h3>
	
	<h4>
		pageContext.getOut() 메서드를 이용한 데이터 출력 : 
		<% 
		pageContext.getOut().println("안녕하세요!"); 
		%>
	</h4>
</body>
</html>