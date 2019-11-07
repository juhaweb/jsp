<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-4</title>
</head>
<body>
	<h3> 4. request 내장객체 멤버 </h3>
	<p>
	헤더정보 : <%= request.getHeader("User-Agent") %> <br/>
	통신규약 : <%= request.getProtocol() %> <br/>
	요청주소 : <%= request.getServerName() %> <br/>
	요정경로 : <%= request.getRequestURL() %> <br/>
	클라이언트 : <%= request.getRequestURI()%> <br/>
	사용자IP : <%= request.getRemoteAddr() %> <br/>
	
	
	
</body>
</html>