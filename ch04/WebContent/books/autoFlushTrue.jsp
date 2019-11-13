<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>autoFlush 속성값 true예제 </title>
</head>
<body>
	<h1>autoFlush 속성값 true예제</h1>
	<% for (int i=0; i<1000; i++){ %>
	true
	<% } %>
	
</body>
</html>