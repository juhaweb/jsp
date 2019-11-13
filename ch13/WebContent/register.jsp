<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>등록완료</title>
</head>
<body>
	<h1>index -> register 등록완료 회원정보 출력</h1>
	
	<%
	// 한글깨짐 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 세션정보 받기?
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String rdate = request.getParameter("rdate");
	
	%>
	
	
	
	<p>
		이   름 : <%= name %>
		휴대폰 : <%= hp %>
		직   급 : <%= pos %>
		입사일 : <%= rdate %>	
	</p>
	
</body>
</html>