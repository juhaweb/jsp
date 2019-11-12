<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Success</title>
</head>
<body>
	<h1>로그인완료</h1>
	
	<% 
	// 세션 아이디 추출
	String uid = (String) session.getAttribute("uid"); 
	%>
	
	<p>
	<%=uid %>님 반갑습니다! <br>
	<a href="./logout.jsp">로그아웃</a>
	</p>
	
</body>
</html>