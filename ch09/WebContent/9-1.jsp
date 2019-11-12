<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>9-1.cookie</title>
</head>
<body>
	<h1>9-1. 쿠키 </h1>
	
	<%
		// 쿠키생성
		Cookie c1 = new Cookie("name","홍길동");
		Cookie c2 = new Cookie("uid","hong");
		
		// 쿠키수명(유통기한) 3분동안. 
		c1.setMaxAge(60*3);
		c2.setMaxAge(60*3);
		
		//response에 c1실어서 보냄. 
		response.addCookie(c1);
		response.addCookie(c2);
		
	%>
	
	<h3>쿠키생성 후 클라이언트로 전송완료 ! </h3>
	<a href="./9-2.jsp">다시 서버로 쿠키 전송하기</a>
	
	
</body>
</html>