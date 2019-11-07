<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-7 포워딩</title>
</head>
<body>
	<h3> 7.포워딩 페이지</h3>
	<h4> 3-7.jsp 페이지 입니다. </h4>
	
	<% 
		pageContext.forward("https://www.naver.com");
	%>
	
	
	
</body>
</html>