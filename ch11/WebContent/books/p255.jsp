<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("name","홍길동"); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>p255</title>
</head>
<body>
	<h1>EL 기본객체</h1>
	요청URI : ${pageContext.request.requestURI}		<br/>
	requst의 name속성 : ${requestScope.name }	<br/>
	code 파라미터 : ${param.code }
	<!-- EL특징 : code 파라미터 값이 존재하지 않지만, null을 출력하지 않는다. (값이 존재하지 않는 경우 아무것도 출력하지 않는다.) -->
</body>
</html>