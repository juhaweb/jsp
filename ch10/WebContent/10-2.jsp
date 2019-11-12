<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>10-2. 세션값 확인</title>
</head>
<body>
	<h1>10-2. 세션값 확인</h1>
	
	
	<%
		String sid = session.getId();
		String name = (String) session.getAttribute("name");
		// 자바에서 object는 모든 클래스의 최상위 클래스로 형변환 다운캐스팅 가능 
		String uid = (String) session.getAttribute("uid");
		
	%>
	
	<p>
	SID	: <%= sid %> <br>
	NAME: <%= name %> <br>
	UID : <%= uid %> <br>
	</p>
	
</body>
</html>