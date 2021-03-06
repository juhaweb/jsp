<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>11-1. 표현언어 (Expression Language)</title>
</head>
<body>
	<h1>11-1. 표현언어 (Expression Language)</h1>
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;

		request.setAttribute("name","김유신");
		session.setAttribute("name",name);
		pageContext.setAttribute("name",name);
	%>
	
	<h4>표현식</h4>		
	<ul>
		<%-- 프로그래밍에 가깝고 --%>
		<li> name : <%= name %> </li>
		<li> num1 + num2 = <%= num1 + num2 %> </li>
	</ul>
	
	
	<h4>표현언어</h4>
	<ul>
		<%-- 태그에 가까움 --%>
		<li> name : ${ name } </li>
		<li> num1 + num2 = ${ num1 + num2 } </li>
	</ul>
	
	
	
	
	
</body>
</html>